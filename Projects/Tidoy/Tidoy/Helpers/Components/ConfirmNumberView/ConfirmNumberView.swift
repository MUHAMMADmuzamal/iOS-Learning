//
//  ConfirmNumberView.swift
//  Tidoy
//
//  Created by Codes Orbit on 25/12/2024.
//

import SwiftUI

struct ConfirmNumberView: View {
    enum FocusedField: Int {
        case textField1 = 0
        case textField2
        case textField3
        case textField4
        case textField5
        case textField6
    }
    
    @State private var values: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Confirm your number")
                    .foregroundStyle(Color.text100)
                    .font(.heading6)
                Spacer()
                XmarkButton()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Enter the code sent to your phone")
                    .font(.bodySmallRegular)
                HStack(spacing: 8) {
                    ForEach(0..<6) { index in
                        SingleDigitTextField(
                            value: $values[index],
                            isLast: index == 5
                        ) {
                            // Shift focus to the next field
                            focusedField = FocusedField(rawValue: index + 1)
                        }
                        .focused($focusedField, equals: FocusedField(rawValue: index))
                    }
                }
                
                HStack {
                    Text("Didn’t get an SMS?")
                        .font(.bodyXSmallRegular)
                    Button(action: {}, label: {
                        Text("Send again")
                            .font(.bodyXSmallSemiBold)
                    })
                }
                
                PrimaryButton(title: "Continue") {}
                
                HStack {
                    Spacer()
                    Text("Need help?")
                        .font(.bodyXSmallSemiBold)
                        .underline()
                }
            }
            .foregroundStyle(Color.text90)
            .padding(.top, 24)
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    ConfirmNumberView()
}
