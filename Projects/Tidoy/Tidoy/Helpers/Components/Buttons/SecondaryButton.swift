//
//  SecondaryButton.swift
//  Tidoy
//
//  Created by Codes Orbit on 15/07/2024.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? .background30 : backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusM))
            .overlay {
                RoundedRectangle(cornerRadius: .cornerRadiusM)
                    .stroke(configuration.isPressed ? .stroke100 : .stroke40, lineWidth: 1.0)
            }
    }
}

struct SecondaryButton: View {
    var action: () -> Void
    var title: String?
    var leftIcon: Image?
    var rightIcon: Image?
    private var backgroundColor: Color {
        .background10
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
                        .popover(isPresented: /*@START_MENU_TOKEN@*/.constant(false)/*@END_MENU_TOKEN@*/) {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Popover Content@*/Text("Popover Content")/*@END_MENU_TOKEN@*/
                        }
                }
                rightIcon
                
                    .frame(width: 24, height: 24)
            }
            .foregroundStyle(disabled ? .icon50 : .icon100)
            .padding(.padding16)
            .frame(maxWidth: .infinity)
            
        })
        .buttonStyle(SecondaryButtonStyle(backgroundColor: backgroundColor))
        .disabled(disabled)
        .onHover { hoverState in
            self.isHovered = hoverState
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack(spacing: 20) {
        SecondaryButton(rightIcon: Image(systemName: "wifi")) {}
        SecondaryButton(title: "Button", leftIcon: Image(systemName: "plus.circle")) {}
        SecondaryButton(title: "Button", rightIcon: Image(systemName: "wifi")) {}
        SecondaryButton(title: "Skip") {}
            .frame(width: 63, height: 56)
        SecondaryButton(title: "Disabled",
                        leftIcon: Image(systemName: "plus.circle"), rightIcon: Image(systemName: "wifi"),
                        disabled: .constant(true),
                        action: {})
    }
}
