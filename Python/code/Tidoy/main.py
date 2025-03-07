from typing import Union, List, Optional
from fastapi import FastAPI, Depends, HTTPException, Header
from pydantic import BaseModel, EmailStr
from datetime import datetime, timedelta
from jose import JWTError, jwt
from passlib.context import CryptContext
from fastapi.responses import JSONResponse

# Secret keys for JWT
SECRET_KEY = "your_secret_key"
REFRESH_SECRET_KEY = "your_refresh_secret_key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 50
REFRESH_TOKEN_EXPIRE_DAYS = 7

app = FastAPI()

# Password hashing
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Dummy user database (key is now email instead of username)
fake_db = {
    "testuser@example.com": {
        "password": pwd_context.hash("testpassword"),
        "data": {"username": "testuser", "role": "admin"}
    }
}

class UserSignup(BaseModel):
    email: EmailStr
    password: str
    username: str

class UserLogin(BaseModel):
    email: EmailStr
    password: str

class Token(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str

class UserResponse(BaseModel):
    email: str
    username: str
    role: str

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
    if user.email in fake_db:
        raise HTTPException(status_code=400, detail="User with this email already exists")
    
    hashed_password = pwd_context.hash(user.password)
    fake_db[user.email] = {"password": hashed_password, "data": {"username": user.username, "role": "user"}}
    
    return {"message": "User created"}

@app.post("/login", response_model=Token)
def login(user: UserLogin):
    stored_user = fake_db.get(user.email)
    if not stored_user or not pwd_context.verify(user.password, stored_user["password"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    
    access_token = create_access_token({"sub": user.email}, timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
    refresh_token = create_refresh_token({"sub": user.email}, timedelta(days=REFRESH_TOKEN_EXPIRE_DAYS))

    return {"access_token": access_token, "refresh_token": refresh_token, "token_type": "bearer"}

def get_current_user(authorization: Optional[str] = Header(None)):
    if not authorization:
        raise HTTPException(status_code=401, detail="Authorization header missing")

    token = authorization.split("Bearer ")[-1]  # Extract token
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        email = payload.get("sub")
        if email is None or email not in fake_db:
            raise HTTPException(status_code=401, detail="Invalid token")
        return email
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")

@app.get("/protected")
def protected_route(email: str = Depends(get_current_user)):
    user_data = fake_db[email]["data"]
    return {"message": f"Hello {user_data['username']}, you accessed a protected route!", "user_data": user_data}

@app.post("/refresh-token")
def refresh_token(refresh_token: str):
    try:
        payload = jwt.decode(refresh_token, REFRESH_SECRET_KEY, algorithms=[ALGORITHM])
        email = payload.get("sub")
        if email is None or email not in fake_db:
            raise HTTPException(status_code=401, detail="Invalid refresh token")
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid refresh token")

    new_access_token = create_access_token({"sub": email}, timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
    return {"access_token": new_access_token, "token_type": "bearer"}

@app.get("/users", response_model=List[UserResponse])
def get_users(username: str = Depends(get_current_user)):
    users_list = [
        {
            "email": u,
            "username": d["data"]["username"],
            "role": d["data"]["role"]
        }
        for u, d in fake_db.items()
    ]
    
    return JSONResponse(content={"Users": {"data": users_list}})
