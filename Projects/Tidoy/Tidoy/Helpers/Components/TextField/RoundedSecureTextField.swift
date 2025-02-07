//
//  RoundedSecureTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 05/10/2024.
//

import SwiftUI

struct RoundedSecureTextField: View {
    
    @State var showPassword: Bool = false
    
    @Binding var text: String
    var label: String
    var hintText: String
    var placeholderText: String
    @Binding var state: StateOfTextField
    var leftImage: Image?
    var rightImage: Image?
    var rightImage2: Image?
    var leftImageTapAction: (() -> Void)?
    var rightImageTapAction: (() -> Void)?
    var validatable: Validatable
    
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
                    if showPassword {
                        SecureField("", text: $text)
                    } else {
                        TextField("", text: $text)
                    }
                }
                .onChange(of: text) {
                    state = validatable.validate(text) ? .defaultState : .error }
                    .foregroundColor(state.textColor)
                    .background {
                        if text.isEmpty {
                             HStack {
                                 Text(placeholderText)
                                 Spacer()
                             }
                         }
                    }
                if let rightImage = rightImage, let rightImage2 = rightImage2 {
                    let showPassImage = showPassword ? rightImage : rightImage2
                    showPassImage
                        .foregroundColor(state.textColor)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            showPassword.toggle()
                            rightImageTapAction?()
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
    RoundedSecureTextField( 
        text: .constant("helolo"), 
        label: "hi",
        hintText: "pass",
        placeholderText: "placeHolder",
        state: .constant(.defaultState),
        rightImage: Image(systemName: "eye"),
        rightImage2: Image(systemName: "eye.slash"),
        validatable: PasswordValidator())
}
