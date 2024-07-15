//
//  Button.swift
//  Tidoy
//
//  Created by Codes Orbit on 13/07/2024.
//

import SwiftUI
struct PrimaryButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
         configuration.label
            .background(configuration.isPressed ? .primaryPressed : backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusM))
    }
}

struct PrimaryButton: View {
    var action: () -> Void
    var title: String?
    var leftIcon: Image?
    var rightIcon: Image?
    private var backgroundColor: Color {
            if isHovered {
               return .primaryHover
           } else if disabled {
               return .background50
           } else {
               return .primaryMain
           }
       }
    
    @Binding private var disabled: Bool
    @State private var isHovered: Bool = false
    
    init(title: String? = nil,
         leftIcon: Image? = nil,
         rightIcon: Image? = nil,
         disabled: Binding<Bool> = .constant(false),
         action: @escaping () -> Void) {
        self.action     = action
        self.title      = title
        self.leftIcon   = leftIcon
        self.rightIcon  = rightIcon
        self._disabled  = disabled
    }
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            HStack(spacing: .padding8) {
                leftIcon
                    .foregroundStyle(disabled ? .icon10 : .neutral10)
                    .frame(width: 24, height: 24)
                if let title {
                    Text(title)
                        .font(.bodySmallSemiBold)
                        .foregroundStyle(disabled ? .text10 : .neutral10)
                }
                rightIcon
                    .foregroundStyle(disabled ? .icon10 : .neutral10)
                    .frame(width: 24, height: 24)
            }
            .padding(.padding16)
            .frame(maxWidth: .infinity)
            
        })
        .buttonStyle(PrimaryButtonStyle(backgroundColor: backgroundColor))
        .disabled(disabled)
        .onHover { hoverState in
            self.isHovered = hoverState
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(rightIcon: Image(systemName: "wifi")) {}
        PrimaryButton(title: "Button", leftIcon: Image(systemName: "plus.circle")) {}
        PrimaryButton(title: "Button", rightIcon: Image(systemName: "wifi")) {}
        PrimaryButton(title: "Disabled",
                      leftIcon: Image(systemName: "plus.circle"), rightIcon: Image(systemName: "wifi"),
                      disabled: .constant(true),
                      action: {})
    }
}
