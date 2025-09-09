//
//  Fonts + Extension.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 09/09/2025.
//

import SwiftUI

extension Font {
    static func inter(size: CGFloat, weight: InterWeight = .regular) -> Font {
        let descriptor = UIFontDescriptor(fontAttributes: [
            .name: "Inter",
            kCTFontVariationAttribute as UIFontDescriptor.AttributeName: [
                /* 'wght' */ 0x77676874: weight.rawValue,
            ]
        ])

        return Font(UIFont(descriptor: descriptor, size: size))
    }
}


enum InterWeight: CGFloat {
    case thin       = 100
    case extraLight = 200
    case light      = 300
    case regular    = 400
    case medium     = 500
    case semiBold   = 600
    case bold       = 700
    case extraBold  = 800
    case black      = 900
}
