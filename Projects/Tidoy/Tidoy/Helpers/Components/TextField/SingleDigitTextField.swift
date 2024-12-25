//
//  SingleDigitTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 25/12/2024.
//

import SwiftUI

struct SingleDigitTextField: View, Identifiable {
    let id: String = UUID().uuidString
    @Binding var value: String
    var isLast: Bool = false
    @FocusState var isFocused: Bool
    var focusToNextField: (() -> Void)?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 1)
            .frame(width: 48, height: 48)
            .foregroundStyle(value.isEmpty ? Color.stroke40 : Color.text90)
            .background(Color.background10)
            .overlay {
                TextField("", text: $value)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .focused($isFocused)
                    .font(.heading5)
                    .foregroundColor(Color.text90)
                    .overlay {
                        if value.isEmpty {
                            Text("-")
                                .font(.headline)
                                .foregroundStyle(Color.text60)
                        }
                    }
                    .onChange(of: value) { oldValue, newValue in
                        if newValue.count > 1 {
                            value = String(newValue.prefix(1)) // Restrict to 1 digit
                        }
                        if !isLast && value.count == 1 {
                            focusToNextField?()
                        }
                    }
            }
    }
}

#Preview {
    SingleDigitTextField(value: .constant("1"))
}
