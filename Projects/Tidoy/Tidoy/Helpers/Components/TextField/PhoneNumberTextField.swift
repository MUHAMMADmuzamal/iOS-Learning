//
//  PhoneNumberTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/08/2024.
//

import SwiftUI

struct PhoneNumberTextField: View {

    @State private var isTapOnIcon: Bool = false
    
    @Binding var text: String
    @Binding var state: StateOfTextField
    var label: String
    var hintText: String
    var placeholderText: String
    @Binding var selectedCountry: CountryModel
    var action: (() -> Void)?
    var validatable: Validatable
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(state.labelColor)
                .padding(.bottom, 4)
            HStack(spacing: .padding4) {
                HStack {
                    Text(selectedCountry.flag)
                    Text(selectedCountry.code)
                    Image(systemName: isTapOnIcon ? "chevron.up" : "chevron.down")
                }
                .onTapGesture {
                    isTapOnIcon.toggle()
                    self.action?()
                }
                TextField("", text: $text)
                    .onChange(of: text) {
                        state = validatable.validate(text) ? .defaultState : .error
                    }
                    .foregroundColor(state.textColor)
                    .background {
                        if text.isEmpty {
                             HStack {
                                 Text(placeholderText)
                                 Spacer()
                             }
                         }
                    }
            }
            .foregroundStyle(.icon60)
                .padding(.all, .padding12)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(state.borderColor, lineWidth: 1.0)
                }
            Text(hintText)
                .font(.bodyXSmallRegular)
                .foregroundColor(state.labelColor)
        }
        .padding(.horizontal, 2)
        .disabled(state == .disable)
    }
    
}

#Preview {
    return VStack {
        PhoneNumberTextField(
            text: .constant(""),
            state: .constant(.defaultState),
            label: "Phone Number",
            hintText: "Enter your username",
            placeholderText: "ex: 3465944619",
            selectedCountry: .constant(CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰")),
            validatable: PhoneNumberValidator())
        PhoneNumberTextField(
            text: .constant("1234567890"),
            state: .constant(.defaultState),
            label: "Phone Number",
            hintText: "Enter your username",
            placeholderText: "ex: +923465944619", 
            selectedCountry: .constant(CountryModel(name: "Pakistan",
                                                    code: "+92",
                                                    flag: "🇵🇰")),
            validatable: PhoneNumberValidator())
    }

}
