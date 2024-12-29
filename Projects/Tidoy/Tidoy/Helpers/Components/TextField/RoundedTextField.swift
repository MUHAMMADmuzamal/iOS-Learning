//
//  RoundedTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/07/2024.
//

import SwiftUI

struct RoundedTextField: View {
    @ObservedObject private var viewModel: RoundedTextFieldViewModel
    @Binding var state: StateOfTextField
    @Binding var text: String
    
    var label: String
    var hintText: String
    var placeholderText: String
    var leftImage: Image?
    var rightImage: Image?
    var isSecureField: Bool
    var leftImageTapAction: (() -> Void)?
    var rightImageTapAction: (() -> Void)?
    
    init(fieldType: TextFieldTypeProtocol,
         isSecureField: Bool = false,
         text: Binding<String>,
         label: String,
         hintText: String,
         placeholderText: String,
         state: Binding<StateOfTextField>,
         leftImage: Image? = nil,
         rightImage: Image? = nil,
         leftImageTapAction: (() -> Void)? = nil,
         rightImageTapAction: (() -> Void)? = nil) {
        
        self.viewModel = RoundedTextFieldViewModel(fieldType: fieldType, state: state.wrappedValue, text: text.wrappedValue)
        self._state = state
        self._text = text
        self.label = label
        self.hintText = hintText
        self.placeholderText = placeholderText
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.isSecureField = isSecureField
        self.leftImageTapAction = leftImageTapAction
        self.rightImageTapAction = rightImageTapAction
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(viewModel.state.labelColor)
                .padding(.bottom, 4)
            HStack(spacing: .padding4) {
                if let leftImage = leftImage {
                    leftImage
                        .foregroundColor(viewModel.state.textColor)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            leftImageTapAction?()
                        }
                }
                VStack {
                    if isSecureField {
                        SecureField("", text: $text)
                    }else {
                        TextField("", text: $text)
                    }
                }
                .onChange(of: text) {
                    viewModel.text = text
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
                if let rightImage = rightImage {
                    rightImage
                        .foregroundColor(viewModel.state.textColor)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            rightImageTapAction?()
                        }
                }
            }
            .foregroundStyle(.icon60)
                .padding(.all, .padding12)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(viewModel.state.borderColor, lineWidth: 1.0)
                }
            if viewModel.state == .error {
                Text(hintText)
                    .font(.bodyXSmallRegular)
                    .foregroundColor(viewModel.state.labelColor)
            }
            
        }
        .padding(.horizontal, 2)
        .disabled(viewModel.state == .disable)
        .onChange(of: viewModel.state) { _ , newState in
            state = newState
        }
    }
    
    func setState(_ newState: StateOfTextField) -> some View {
        self.state = newState
        self.viewModel.state = newState
        return self
    }
}

#Preview {
        return VStack {
            RoundedTextField(fieldType: UserNameTextField(),
                             text: .constant("hello"), label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "Placeholder", 
                             state: .constant(.defaultState),
                             leftImage: Image(systemName: "person"),
                             rightImage: Image(systemName: "checkmark"))
            RoundedTextField(fieldType: UserNameTextField(),
                             isSecureField: true, 
                             text: .constant("hi"),
                             label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "Placeholder", 
                             state: .constant(.defaultState),
                             leftImage: Image(systemName: "person"),
                             rightImage: Image(systemName: "checkmark"))
            .setState(.error)
        }
}

enum StateOfTextField {
    case defaultState, hover, focus, fill, disable, error
    
    var labelColor: Color {
        switch self {
        case .error:
            return .red
        default:
            return .black
        }
    }
    
    var textColor: Color {
        switch self {
        case .defaultState, .hover, .disable:
            return .gray
        case .focus, .fill:
            return .black
        case .error:
            return .red
        }
    }
    
    var borderColor: Color {
        switch self {
        case .defaultState, .fill, .disable:
            return .gray
        case .hover:
            return .blue
        case .focus:
            return .green
        case .error:
            return .red
        }
    }
}
