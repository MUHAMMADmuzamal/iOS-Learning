//
//  ShadowButtonStyle.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 16/09/2025.
//

import SwiftUI

struct ShadowButtonStyle: ButtonStyle {
    let background: Color = .deepTeal
    let textColor: Color = .white
    let cornerRadius: CGFloat = 33
    let shadowRadius: CGFloat = 15
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [Color(uiColor: #colorLiteral(red: 0.3029484153, green: 0.5952267647, blue: 0.5818231106, alpha: 1)), Color(uiColor: #colorLiteral(red: 0.3029484153, green: 0.5952267647, blue: 0.5818231106, alpha: 1))], startPoint: .leading, endPoint: .trailing))
            .foregroundStyle(textColor)
            .cornerRadius(cornerRadius)
            .shadow(color: .deepTeal.opacity(0.5), radius: shadowRadius, x: 0, y: 10)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .font(.inter(size: 18, weight: .semiBold))
    }
}
