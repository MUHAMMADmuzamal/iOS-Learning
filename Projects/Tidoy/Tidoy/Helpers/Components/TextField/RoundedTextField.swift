//
//  RoundedTextField.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/07/2024.
//

import SwiftUI

struct RoundedTextField: View {
    private enum StateOfTextField {
        case defaultState, hover, focus, fill, disable, error
    }
    @State var text: String = ""
    @State var label: String = "Label"
    @State var hintText: String = "This is a hint text to help user"
    @State var placeholderText: String = "Placeholder"
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            HStack(spacing: .padding4) {
                Image(systemName: "plus.circle")
                    .frame(width: 24, height: 24)
                TextField("", text: $text)
                    .background {
                        if text.isEmpty {
                            HStack {
                                Text(placeholderText)
                                Spacer()
                            }
                        }
                    }
                Image(systemName: "plus.circle")
                    .frame(width: 24, height: 24)
            }
            .foregroundStyle(.icon60)
                .padding(.all, .padding12)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.stroke40, lineWidth: 1.0)
                }
            Text(hintText)
                .font(.bodyXSmallRegular)
        }
        .font(.bodySmallMedium)
        .foregroundStyle(.text100)
        .padding(.horizontal, 2)    }
}

#Preview {
    VStack {
        RoundedTextField()
        RoundedTextField()
            .frame(width: 200)
    }
}
