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
    
    private var router: LoginRouterProtocol!
    
    init(router: LoginRouterProtocol) {
        self.router = router
    }
    
    @State private var loginMethod: LoginMethod = .phoneNumber
    @State private var phoneNumberFieldText: String = ""
    @State private var emailFieldText: String = ""
    @State private var passwordFieldText: String = ""
    @State private var showCountrySheet: Bool = false
    @State private var emailFieldState: StateOfTextField = .defaultState
    @State private var passwordFieldState: StateOfTextField = .defaultState
    @State private var phoneNumberFieldState: StateOfTextField = .defaultState
    @State private var selectedCountry: CountryModel = .defaultCountry
    
    let textFieldsHeight: CGFloat = 48.0
    
    var body: some View {
        VStack(alignment: .leading) {
            heading
            selectionBar
            TabView(selection: $loginMethod) {
                loginWithEmailSection.tag(LoginMethod.email)
                loginWithPhoneNumberSection.tag(LoginMethod.phoneNumber)
            }
            .frame(height: loginMethod == .phoneNumber ? 180 : 250)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding(.top, .padding12)
            bottomSection
            Spacer()
        }
        .padding(.horizontal, 16)
        .sheet(isPresented: $showCountrySheet, content: {
            CountryListView { country in
                selectedCountry = country ?? CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰")
            }
            .presentationDetents([.medium, .large])
            .presentationBackground(.clear)
            
        })
        
    }
    
    func updateLoginMethod(to method: LoginMethod) {
        withAnimation(.smooth) {
            loginMethod = method
        }
    }
}

extension LoginView {
    private var heading: some View {
        Text("Welcome to Tidoy 👋")
            .font(.heading6)
            .foregroundStyle(.text100)
    }
    
    private var selectionBar: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(.background20)
                
                    .overlay {
                        HStack {
                            RoundedRectangle(cornerRadius: 21.0)
                                .foregroundStyle(.background100)
                                .frame(width: geometry.size.width / 2 , height: 42)
                                .padding(.leading, loginMethod == .email ? 5 : (geometry.size.width / 2) - 5)
                            Spacer()
                        }
                    }
                    .overlay {
                        HStack {
                            Text("Username")
                                .foregroundStyle(loginMethod == .email ? .text10 : .text100)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    updateLoginMethod(to: .email)
                                }
                            Spacer()
                            Text("Phone Number")
                                .foregroundStyle(loginMethod == .email ? .text100 : .text10)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    updateLoginMethod(to: .phoneNumber)
                                }
                            
                        }
                        .font(.bodySmallMedium)
                        .padding(.all, 4)
                    }
            }
        }
        .frame(height: 50)
    }
    
    private var loginWithEmailSection: some View {
        VStack(alignment: .leading) {
            RoundedTextField(text: $emailFieldText,
                             label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "ex: Johnedeo",
                             state: $emailFieldState,
                             validatable: EmailValidator())
            RoundedSecureTextField(
                text: $passwordFieldText,
                label: "Password",
                hintText: "Enter your username",
                placeholderText: "Password",
                state: $passwordFieldState,
                rightImage: Image(systemName: "eye"),
                rightImage2: Image(systemName: "eye.slash"),
                validatable: PasswordValidator())
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
    
    private var loginWithPhoneNumberSection: some View {
        VStack {
            PhoneNumberTextField(
                text: $passwordFieldText,
                state: $phoneNumberFieldState,
                label: "Phone Number",
                hintText: "We'll call or text you to confirm your number. Standard message and data rates apply",
                placeholderText: "ex : 81234567890",
                selectedCountry: $selectedCountry, action: {
                    self.showCountrySheet.toggle()
                },
                validatable: PhoneNumberValidator())
        }
    }
    
    private var bottomSection: some View {
        VStack {
            PrimaryButton(title: "Login") {
                router.navigateToHome()
            }
            Spacer()
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
                    .onTapGesture {
                        router.navigateToSignUp()
                    }
            }
            .padding(.top, .padding80)
        }
    }
}

#Preview {
    LoginView(router: LoginRouter(injector: DependenciesHolder().injector()))
}
