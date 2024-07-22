//
//  LoginView.swift
//  Tidoy
//
//  Created by Codes Orbit on 17/07/2024.
//

import SwiftUI

enum LoginMethod: Int {
    case email = 0
    case phoneNumber
}
struct LoginView: View {
    @State private var loginMethod: LoginMethod = .email
    @State private var emailFieldText: String = ""
    @State private var passwordFieldText: String = ""
    
    let textFieldsHeight: CGFloat = 48.0
    
    var heading: some View {
        Text("Welcome to Tidoy 👋")
            .font(.heading6)
            .foregroundStyle(.text100)
    }
    
    var selectionBar: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundStyle(.background20)
            .frame(height: 50)
            .overlay {
                HStack {
                    RoundedRectangle(cornerRadius: 21.0)
                        .foregroundStyle(loginMethod == .email ? .background100 : .background20)
                        .overlay {
                            Text("Username")
                                .foregroundStyle(loginMethod == .email ? .text10 : .text100)
                        }
                        .onTapGesture {
                            updateLoginMethod(to: .email)
                        }
                        
                    RoundedRectangle(cornerRadius: 21.0)
                        .foregroundStyle(loginMethod == .phoneNumber ? .background100 : .background20)
                        .overlay {
                            Text("Phone Number")
                                .foregroundStyle(loginMethod == .email ? .text100 : .text10)
                        }
                        .onTapGesture {
                            updateLoginMethod(to: .phoneNumber)
                        }
                }
                .font(.bodySmallMedium)
                .padding(.all, 4)
            }
    }
    
    var loginWithEmailSection: some View {
        VStack(alignment: .leading) {
            Text("Username")
            TextField("ex: johndoe", text: $emailFieldText)
                .frame(height: textFieldsHeight)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.0)
                }
            Text("Password")
            SecureField("Password", text: $passwordFieldText)
                .frame(height: textFieldsHeight)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.0)
                }
            HStack {
                Text("Need a help?")
                Spacer()
                Text("Forget Password")
            }
            .font(.bodyXSmallSemiBold)
            .foregroundStyle(.text90)
            .underline()
            Spacer()
        }
        .font(.bodySmallMedium)
        .foregroundStyle(.text100)
        .padding(.horizontal, 2)
    }
    
    var loginWithPhoneNumberSection: some View {
        Text("Phone")
    }
    
    var bottomSection: some View {
        VStack {
            PrimaryButton(title: "Login") { }
            
            Divider()
                .foregroundStyle(.background30)
                .frame(height: 26)
                .overlay {
                RoundedRectangle(cornerRadius: 13)
                    .fill(.background30)
                    .frame(width: 47)
                    .overlay {
                        Text("OR")
                            .foregroundStyle(.text60)
                            .font(.bodyXSmallSemiBold)
                    }
            }
                .padding(.top, 32)
            
            HStack(spacing: .padding12) {
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .fill(.googleBackground)
                    .overlay {
                        Image("googleLogo")
                            .frame(width: 20, height: 20)
                    }
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .fill(.blueF3)
                    .overlay {
                        Image("facebookLogo")
                            .frame(width: 20, height: 20)
                    }
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .fill(.appleBackground)
                    .overlay {
                        Image("appleLogo")
                            .frame(width: 20, height: 20)
                    }
            }
            .frame(height: 56)
            .padding(.top, .padding24)
            HStack {
                Text("Don’t have a account ?")
                    .foregroundStyle(.text100)
                    .font(.bodyXSmallRegular)
                Text("Register here")
                    .underline()
                    .foregroundStyle(.primaryMain)
                    .font(.bodyXSmallSemiBold)
            }
            .padding(.top, .padding80)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            heading
            selectionBar
            TabView(selection: $loginMethod) {
                loginWithEmailSection.tag(LoginMethod.email)
                loginWithPhoneNumberSection.tag(LoginMethod.phoneNumber)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding(.top, .padding12)
            bottomSection
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    func updateLoginMethod(to method: LoginMethod) {
        withAnimation(.easeInOut) {
            loginMethod = method
        }
    }
}

#Preview {
    LoginView()
}
