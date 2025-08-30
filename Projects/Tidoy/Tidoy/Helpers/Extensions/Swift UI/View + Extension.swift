//
//  View + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

extension View {
    func isHiddenWithOutSpace(_ hidden: Bool) -> some View {
        self.modifier(HiddenWithOutSpaceModifier(isHidden: hidden))
    }
    
    func isHiddenWithSpace(_ hidden: Bool) -> some View {
        self.modifier(HiddenWithSpaceModifier(isHidden: hidden))
    }
}

struct HiddenWithOutSpaceModifier: ViewModifier {
    @State var isHidden: Bool = false
    
    func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        }else {
            content
        }
    }
}

struct HiddenWithSpaceModifier: ViewModifier {
    @State var isHidden: Bool = false
    
    func body(content: Content) -> some View {
        if isHidden {
            content.hidden()
        }else {
            content
        }
    }
}

extension View {
    func roundedBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat = 1) -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: lineWidth)
        )
    }
}
