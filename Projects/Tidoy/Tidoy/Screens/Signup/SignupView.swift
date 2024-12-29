//
//  SignupView.swift
//  Tidoy
//
//  Created by Codes Orbit on 28/12/2024.
//

import SwiftUI

struct SignupView: View {
    @State private var selectedCountry: CountryModel = CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰")
    @State private var showCountrySheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            heading
                .padding(.bottom, 24)
            formSection
                .padding(.bottom, 34)
            PrimaryButton(title: "Login") { }
                .padding(.bottom, 20)
            footerSection
        }
        .padding(.horizontal, 16)
    }
    
    private var heading: some View {
         Text("Welcome to Tidoy 👋")
             .font(.heading6)
             .foregroundStyle(.text100)
     }
    
    private var formSection: some View {
        VStack {
            RoundedTextField(fieldType: UserNameTextField(),
                             label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "ex: Johnedeo",
                             state: .constant(.defaultState))
            RoundedTextField(fieldType: UserNameTextField(),
                             label: "Email",
                             hintText: "Enter your email",
                             placeholderText: "ex: Johnedeo@gmail.com",
                             state: .constant(.defaultState))
            
            PhoneNumberTextField(
                fieldType: PhoneTypeTextField(),
                label: "Phone Number",
                hintText: "We'll call or text you to confirm your number. Standard message and data rates apply",
                placeholderText: "ex : 81234567890",
                selectedCountry: selectedCountry) {
                    self.showCountrySheet.toggle()
                }
            
            RoundedSecureTextField(
                fieldType: UserNameTextField(),
                label: "Password",
                hintText: "Enter your username",
                placeholderText: "Password",
                state: .constant(.defaultState),
                rightImage: Image(systemName: "eye"),
                rightImage2: Image(systemName: "eye.slash"))
            RoundedSecureTextField(
                fieldType: UserNameTextField(),
                label: "Password",
                hintText: "Enter your username",
                placeholderText: "Password",
                state: .constant(.defaultState),
                rightImage: Image(systemName: "eye"),
                rightImage2: Image(systemName: "eye.slash"))
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
        }
    }
}

#Preview {
    SignupView()
}
