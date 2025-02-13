//
//  RoundedTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/07/2024.
//

import SwiftUI

struct RoundedTextField: View {
    
    @Binding var text: String
    var label: String
    var hintText: String
    var placeholderText: String
    @Binding var state: StateOfTextField
    var leftImage: Image?
    var rightImage: Image?
    
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
                    TextField("", text: $text)
                        .onChange(of: text) { _, newValue in
                            state = validatable.validate(newValue) ? .defaultState : .error
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
        RoundedTextField(text: .constant("hello"),
                         label: "Username",
                         hintText: "Enter your username",
                         placeholderText: "Placeholder",
                         state: .constant(.defaultState),
                         leftImage: Image(systemName: "person"),
                         rightImage: Image(systemName: "checkmark"),
                         leftImageTapAction: nil, 
                         validatable: UsernameValidator())
        RoundedTextField(text: .constant("hi"),
                         label: "Username",
                         hintText: "Enter your username",
                         placeholderText: "Placeholder", 
                         state: .constant(.defaultState),
                         leftImage: Image(systemName: "person"),
                         rightImage: Image(systemName: "checkmark"),
                         validatable: UsernameValidator())
    }
}
