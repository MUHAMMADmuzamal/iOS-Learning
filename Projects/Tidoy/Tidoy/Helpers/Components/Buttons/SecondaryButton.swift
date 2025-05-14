//
//  SecondaryButton.swift
//  Tidoy
//
//  Created by Codes Orbit on 15/07/2024.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    var backgroundColor: Color
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? .background30 : backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(configuration.isPressed ? .stroke100 : .stroke40, lineWidth: 1.0)
            }
    }
}
struct SecondaryButton: View {
    let action: () -> Void
    let title: String?
    let leftIcon: Image?
    let rightIcon: Image?
    let titleFont: Font
    let cornerRadius: CGFloat
    private var backgroundColor: Color {
        .background10
    }
    
    @Binding private var disabled: Bool
    @State private var isHovered: Bool = false
    
    init(title: String? = nil,
         titleFont: Font = .bodySmallSemiBold,
         cornerRadius: CGFloat = .cornerRadiusM,
         leftIcon: Image? = nil,
         rightIcon: Image? = nil,
         disabled: Binding<Bool> = .constant(false),
         action: @escaping () -> Void) {
        self.action         = action
        self.title          = title
        self.titleFont      = titleFont
        self.leftIcon       = leftIcon
        self.rightIcon      = rightIcon
        self._disabled      = disabled
        self.cornerRadius   = cornerRadius
    }
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            HStack(spacing: .padding8) {
                leftIcon
                    .frame(width: 24, height: 24)
                if let title {
                    Text(title)
                        .font(.bodySmallSemiBold)
                        .foregroundStyle(disabled ? .text50 : .text100)
                }
                rightIcon
                
                    .frame(width: 24, height: 24)
            }
            .foregroundStyle(disabled ? .icon50 : .icon100)
            .padding(.horizontal, .padding16)
            .padding(.vertical, .padding8)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        })
        .buttonStyle(SecondaryButtonStyle(backgroundColor: backgroundColor, cornerRadius: cornerRadius))
        .disabled(disabled)
        .onHover { hoverState in
            self.isHovered = hoverState
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        SecondaryButton(rightIcon: Image(systemName: "wifi")) {}
        SecondaryButton(title: "Button", leftIcon: Image(systemName: "plus.circle")) {}
        SecondaryButton(title: "Button", rightIcon: Image(systemName: "wifi")) {}
        SecondaryButton(title: "Skip") {}
            .frame(width: 63, height: 56)
        SecondaryButton(title: "Change", titleFont: .bodyXSmallSemiBold, cornerRadius: .cornerRadiusXS) {}
            .frame(width: 85, height: 34)
        SecondaryButton(title: "Disabled",
                        leftIcon: Image(systemName: "plus.circle"), rightIcon: Image(systemName: "wifi"),
                        disabled: .constant(true),
                        action: {})
    }
}
