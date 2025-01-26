//
//  RoundedTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/07/2024.
//

import SwiftUI

struct RoundedTextField: View {
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
    var validation: ((String) -> Void)?
    
    init(isSecureField: Bool = false,
         text: Binding<String>,
         label: String,
         hintText: String,
         placeholderText: String,
         state: Binding<StateOfTextField>,
         leftImage: Image? = nil,
         rightImage: Image? = nil,
         leftImageTapAction: (() -> Void)? = nil,
         rightImageTapAction: (() -> Void)? = nil,
         validation: ((String)->Void)?) {
        
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
        self.validation = validation
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(state.labelColor)
                .padding(.bottom, 4)

            HStack(spacing: .padding4) {
                if let leftImage = leftImage {
                    leftImage
                        .foregroundColor(state.textColor)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            leftImageTapAction?()
                        }
                }
                VStack {
                    if isSecureField {
                        SecureField("", text: $text)
                    } else {
                        TextField("", text: $text)
                            .onChange(of: text) { _, newValue in
                                validation?(newValue)
                            }
                    }
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

                if let rightImage = rightImage {
                    rightImage
                        .foregroundColor(state.textColor)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            rightImageTapAction?()
                        }
                }
            }
            .padding(.all, .padding12)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(state.borderColor, lineWidth: 1.0)
            }

            if state == .error {
                Text(hintText)
                    .font(.bodyXSmallRegular)
                    .foregroundColor(state.labelColor)
            }
        }
        .padding(.horizontal, 2)
        .disabled(state == .disable)
    }

}

#Preview {
        return VStack {
            RoundedTextField(text: .constant("hello"), label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "Placeholder", 
                             state: .constant(.defaultState),
                             leftImage: Image(systemName: "person"),
                             rightImage: Image(systemName: "checkmark"),
                             validation: nil)
            RoundedTextField(isSecureField: true,
                             text: .constant("hi"),
                             label: "Username",
                             hintText: "Enter your username",
                             placeholderText: "Placeholder", 
                             state: .constant(.defaultState),
                             leftImage: Image(systemName: "person"),
                             rightImage: Image(systemName: "checkmark"),
                             validation: nil)
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
