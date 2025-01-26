//
//  RoundedSecureTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 05/10/2024.
//

import SwiftUI

struct RoundedSecureTextField: View {
    @Binding var state: StateOfTextField
    @Binding var text: String
    @State var showPassword: Bool = false
    
    var label: String
    var hintText: String
    var placeholderText: String
    var leftImage: Image?
    var rightImage: Image?
    var rightImage2: Image?
    var leftImageTapAction: (() -> Void)?
    var rightImageTapAction: (() -> Void)?
    var validation: ((String) -> Void)?
    
    init(text: Binding<String>,
         label: String,
         hintText: String,
         placeholderText: String,
         state: Binding<StateOfTextField>,
         leftImage: Image? = nil,
         rightImage: Image? = nil,
         rightImage2: Image? = nil,
         leftImageTapAction: (() -> Void)? = nil,
         rightImageTapAction: (() -> Void)? = nil,
         validation: ((String) -> Void)?) {
        
        self._state = state
        self._text = text
        self.label = label
        self.hintText = hintText
        self.placeholderText = placeholderText
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.rightImage2 = rightImage2
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
                    if showPassword {
                        SecureField("", text: $text)
                    } else {
                        TextField("", text: $text)
                    }
                }
                .onChange(of: text) {
                        validation?(text)
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
                if let rightImage = rightImage, let rightImage2 = rightImage2  {
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
        .onChange(of: state) { newState in
            state = newState
        }
    }
}

#Preview {
    RoundedSecureTextField( text: .constant("helolo"), label: "hi", hintText: "pass", placeholderText: "placeHolder", state: .constant(.defaultState),
    rightImage: Image(systemName: "eye"),
                           
                            rightImage2: Image(systemName: "eye.slash"), validation: nil)
}
