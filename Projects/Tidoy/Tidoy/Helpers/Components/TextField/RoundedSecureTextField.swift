//
//  RoundedSecureTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 05/10/2024.
//

import SwiftUI

struct RoundedSecureTextField: View {
    @ObservedObject private var viewModel: RoundedTextFieldViewModel
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
    
    init(fieldType: TextFieldTypeProtocol,
         text: Binding<String>,
         label: String,
         hintText: String,
         placeholderText: String,
         state: Binding<StateOfTextField>,
         leftImage: Image? = nil,
         rightImage: Image? = nil,
         rightImage2: Image? = nil,
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
        self.rightImage2 = rightImage2
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
                    if showPassword {
                        SecureField("", text: $viewModel.text)
                    } else {
                        TextField("", text: $viewModel.text)
                    }
                }
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
                if let rightImage = rightImage, let rightImage2 = rightImage2  {
                    let showPassImage = showPassword ? rightImage : rightImage2
                    showPassImage
                        .foregroundColor(viewModel.state.textColor)
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
                        .stroke(viewModel.state.borderColor, lineWidth: 1.0)
                }
            Text(hintText)
                .font(.bodyXSmallRegular)
                .foregroundColor(viewModel.state.labelColor)
        }
        .padding(.horizontal, 2)
        .disabled(viewModel.state == .disable)
        .onChange(of: viewModel.state) { newState in
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
    RoundedSecureTextField(fieldType: UserNameTextField(), text: .constant("helolo"), label: "hi", hintText: "pass", placeholderText: "placeHolder", state: .constant(.defaultState),
    rightImage: Image(systemName: "eye"),
                           
    rightImage2: Image(systemName: "eye.slash"))
}
