//
//  PhoneNumberTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/08/2024.
//

import SwiftUI

struct PhoneNumberTextField: View {
    @ObservedObject private var viewModel: PhoneNumberTextFieldViewModel
    
    var label: String
    var hintText: String
    var placeholderText: String
    var action: (() -> Void)?
    
    init(fieldType: TextFieldTypeProtocol,
         label: String,
         hintText: String,
         placeholderText: String,
         selectedCountry: CountryModel,
         action: (() -> Void)? = nil) {
        
        self.viewModel = PhoneNumberTextFieldViewModel(fieldType: fieldType, selectedCountry: selectedCountry)
        self.label = label
        self.hintText = hintText
        self.placeholderText = placeholderText
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(viewModel.state.labelColor)
                .padding(.bottom, 4)
            HStack(spacing: .padding4) {
                HStack {
                    Text(viewModel.selectedCountry.flag)
                    Text(viewModel.selectedCountry.code)
                    Image(systemName: viewModel.isTapOnIcon ? "chevron.up" : "chevron.down")
                }
                .onTapGesture {
                    viewModel.isTapOnIcon.toggle()
                    self.action?()
                }
                TextField("", text: $viewModel.text)
                    .onChange(of: viewModel.text) {
                        viewModel.validate()
                    }
                    .onTapGesture {
                        viewModel.onFocusChange(isFocused: true)
                    }
                    .onHover { isHovering in
                        viewModel.onHover(isHovering: isHovering)
                    }
                    .foregroundColor(viewModel.state.textColor)
                    .background {
                        if viewModel.text.isEmpty {
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
                        .stroke(viewModel.state.borderColor, lineWidth: 1.0)
                }
            Text(hintText)
                .font(.bodyXSmallRegular)
                .foregroundColor(viewModel.state.labelColor)
        }
        .padding(.horizontal, 2)
        .disabled(viewModel.state == .disable)
    }
    
    func setState(_ newState: StateOfTextField) -> some View {
        self.viewModel.state = newState
        return self
    }
}

#Preview {
    return VStack {
        PhoneNumberTextField(fieldType: UserNameTextField(),
                             label: "Phone Number",
                             hintText: "Enter your username",
                             placeholderText: "ex: 3465944619", selectedCountry: CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"))
        PhoneNumberTextField(fieldType: UserNameTextField(),
                             label: "Phone Number",
                             hintText: "Enter your username",
                             placeholderText: "ex: +923465944619", selectedCountry: CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"))
        .setState(.error)
    }

}
