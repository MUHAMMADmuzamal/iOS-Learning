//
//  SignupView.swift
//  Tidoy
//
//  Created by Codes Orbit on 28/12/2024.
//

import SwiftUI

struct SignupView: View {
    
    private var router: SignupRouterProtocol!
    
    init (router: SignupRouterProtocol) {
        self.router = router
    }
    
    @State private var selectedCountry: CountryModel = .defaultCountry
    @State private var showCountrySheet: Bool = false
    
    @State private var userNameFieldState: StateOfTextField = .defaultState
    @State private var emailFieldState: StateOfTextField = .defaultState
    @State private var passwordFieldState: StateOfTextField = .defaultState
    @State private var confirmPasswordFieldState: StateOfTextField = .defaultState
    @State private var phoneNumberFieldState: StateOfTextField = .defaultState
    @State private var isDisabledRegisterButton: Bool = true
    
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                heading
                    .padding(.bottom, 24)
                
                formSection
                    .padding(.bottom, 34)
                PrimaryButton(title: "Register", disabled: $isDisabledRegisterButton ) { }
                
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    footerSection
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            .sheet(isPresented: $showCountrySheet, onDismiss: {
                showCountrySheet = false
            }, content: {
                CountryListView { country in
                    selectedCountry = country ?? .defaultCountry
                }
                .presentationDetents([.medium, .large])
                .presentationBackground(.clear)
                
            })
            .onChange(of: formStates) {
                isDisabledRegisterButton = formStates.contains(.error)
            }
        }
    }
    
    private var heading: some View {
        Text("Welcome to Tidoy 👋")
            .font(.heading6)
            .foregroundStyle(.text100)
    }
    
    private var formSection: some View {
        VStack {
            RoundedTextField(text: $userName,
                             label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "ex: Johnedeo",
                             state: $userNameFieldState,
                             validatable: UsernameValidator())
            RoundedTextField(text: $email, label: "Email",
                             hintText: "Enter your email",
                             placeholderText: "ex: Johnedeo@gmail.com",
                             state: $emailFieldState, validatable: EmailValidator())
            
            PhoneNumberTextField(
                text: $phoneNumber,
                state: $phoneNumberFieldState,
                label: "Phone Number",
                hintText: "We'll call or text you to confirm your number. Standard message and data rates apply",
                placeholderText: "ex : 81234567890",
                selectedCountry: $selectedCountry, action: {
                    self.showCountrySheet.toggle()
                },
                validatable: PhoneNumberValidator())
            
            RoundedSecureTextField(
                text: $password,
                label: "Password",
                hintText: "Enter your username",
                placeholderText: "Password",
                state: $passwordFieldState,
                rightImage: Image(systemName: "eye"),
                rightImage2: Image(systemName: "eye.slash"),
                validatable: PasswordValidator())
            RoundedSecureTextField(
                text: $confirmPassword,
                label: "Confirm Password",
                hintText: "Enter your username",
                placeholderText: "Password",
                state: $confirmPasswordFieldState,
                rightImage: Image(systemName: "eye"),
                rightImage2: Image(systemName: "eye.slash"),
                validatable: PasswordValidator())
        }
    }
    
    private var footerSection: some View {
        HStack {
            Text("have a account ? ")
                .foregroundStyle(.text100)
                .font(.bodyXSmallRegular)
            Text("Login here")
                .underline()
                .foregroundStyle(.primaryMain)
                .font(.bodyXSmallSemiBold)
                .onTapGesture {
                    router.navigateToSignIn()
                }
        }
    }
    
    private var formStates: [StateOfTextField] {
        [userNameFieldState, emailFieldState, passwordFieldState, confirmPasswordFieldState, phoneNumberFieldState]
    }
}

#Preview {
    SignupView(router: SignupRouterRouter(injector: DependenciesHolder().injector(), coordinator: AppCoordinator()))
}
