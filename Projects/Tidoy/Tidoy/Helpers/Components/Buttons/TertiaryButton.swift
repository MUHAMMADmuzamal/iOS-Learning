//
//  TertiartyButton.swift
//  Tidoy
//
//  Created by Codes Orbit on 15/07/2024.
//

import SwiftUI

struct TertiaryButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
         configuration.label
            .background(configuration.isPressed ? .background30 : backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusM))
    }
}

struct TertiaryButton: View {
    var action: () -> Void
    var title: String?
    var leftIcon: Image?
    var rightIcon: Image?
    private var backgroundColor: Color {
            if isHovered {
               return .background20
           } else if disabled {
               return .clear
           } else {
               return .clear
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
                    
                    .frame(width: 24, height: 24)
                if let title {
                    Text(title)
                        .font(.bodySmallSemiBold)
                        .foregroundStyle(disabled ? .text50 : .text100)
                }
                rightIcon
                    .frame(width: 24, height: 24)
            }
            .padding(.padding16)
            .frame(maxWidth: .infinity)
            
        })
        .foregroundStyle(disabled ? .icon50 : .icon100)
        .buttonStyle(TertiaryButtonStyle(backgroundColor: backgroundColor))
        .disabled(disabled)
        .onHover { hoverState in
            self.isHovered = hoverState
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack(spacing: 20) {
        TertiaryButton(rightIcon: Image(systemName: "wifi")) {}
        TertiaryButton(title: "Button", leftIcon: Image(systemName: "plus.circle")) {}
        TertiaryButton(title: "Button", rightIcon: Image(systemName: "wifi")) {}
        TertiaryButton(title: "Disabled",
                      leftIcon: Image(systemName: "plus.circle"), 
                       rightIcon: Image(systemName: "wifi"),
                       disabled: .constant(true),
                      action: {})
    }
}
