from typing import Union
from fastapi import FastAPI, Depends, HTTPException, Header
from pydantic import BaseModel
from datetime import datetime, timedelta
from jose import JWTError, jwt
from passlib.context import CryptContext
from typing import List, Optional
import bcrypt

# Secret key for JWT
SECRET_KEY = "your_secret_key"
REFRESH_SECRET_KEY = "your_refresh_secret_key"  # Separate secret for refresh tokens
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 1
REFRESH_TOKEN_EXPIRE_DAYS = 7

app = FastAPI()

# Password hashing
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Dummy user database (pre-filled with a test user)
fake_db = {
    "testuser": {
        "password": pwd_context.hash("testpassword"),
        "data": {"email": "testuser@example.com", "role": "admin"}
    }
}

class UserSignup(BaseModel):
    username: str
    password: str

class UserLogin(BaseModel):
    username: str
    password: str

class Token(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str

def create_access_token(data: dict, expires_delta: timedelta):
    to_encode = data.copy()
    expire = datetime.utcnow() + expires_delta
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

def create_refresh_token(data: dict, expires_delta: timedelta):
    to_encode = data.copy()
    expire = datetime.utcnow() + expires_delta
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, REFRESH_SECRET_KEY, algorithm=ALGORITHM)

@app.post("/signup")
def signup(user: UserSignup):
    if user.username in fake_db:
        raise HTTPException(status_code=400, detail="User already exists")
    hashed_password = pwd_context.hash(user.password)
    fake_db[user.username] = {"password": hashed_password, "data": {"email": f"{user.username}@example.com", "role": "user"}}
    return {"message": "User created"}

@app.post("/login", response_model=Token)
def login(user: UserLogin):
    stored_user = fake_db.get(user.username)
    if not stored_user or not pwd_context.verify(user.password, stored_user["password"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    
    access_token = create_access_token({"sub": user.username}, timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
    refresh_token = create_refresh_token({"sub": user.username}, timedelta(days=REFRESH_TOKEN_EXPIRE_DAYS))

    return {"access_token": access_token, "refresh_token": refresh_token, "token_type": "bearer"}

@app.get("/protected")
def protected_route(token: str):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username = payload.get("sub")
        if username is None or username not in fake_db:
            raise HTTPException(status_code=401, detail="Invalid token")
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")
    
    user_data = fake_db[username]["data"]
    return {"message": f"Hello {username}, you accessed a protected route!", "user_data": user_data}

@app.post("/refresh-token")
def refresh_token(refresh_token: str):
    try:
        payload = jwt.decode(refresh_token, REFRESH_SECRET_KEY, algorithms=[ALGORITHM])
        username = payload.get("sub")
        if username is None or username not in fake_db:
            raise HTTPException(status_code=401, detail="Invalid refresh token")
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid refresh token")

    # Generate a new access token
    new_access_token = create_access_token({"sub": username}, timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
    return {"access_token": new_access_token, "token_type": "bearer"}


class UserResponse(BaseModel):
    username: str
    email: str
    role: str

def get_current_user(authorization: Optional[str] = Header(None)):
    print(f"Authorization Header Received: {authorization}")
    if not authorization:
        raise HTTPException(status_code=401, detail="Authorization header missing")

    token = authorization.split("Bearer ")[-1]  # Extract token
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username = payload.get("sub")
        if username is None or username not in fake_db:
            raise HTTPException(status_code=401, detail="Invalid token")
        return username
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")

@app.get("/users", response_model=List[UserResponse])
def get_users(username: str = Depends(get_current_user)):
    users_list = [
        UserResponse(username=u, email=d["data"]["email"], role=d["data"]["role"])
        for u, d in fake_db.items()
    ]
    return users_list
