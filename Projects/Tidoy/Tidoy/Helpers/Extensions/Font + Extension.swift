// 
//  Font + Extension.swift
//  Tidoy
//
//  Created by Codes Orbit on 11/07/2024.
//

import SwiftUI

extension Font {
    // Heading
    static let heading1 = getFont(.manropeBold, 48)
    static let heading2 = getFont(.manropeBold, 40)
    static let heading3 = getFont(.manropeBold, 32)
    static let heading4 = getFont(.manropeBold, 24)
    static let heading5 = getFont(.manropeBold, 20)
    static let heading6 = getFont(.manropeBold, 18)
    
    // Body Large
    static let bodyLargeSemiBold = getFont(.manropeSemiBold, 18)
    static let bodyLargeMedium = getFont(.manropeMedium, 18)
    static let bodyLargeRegular = getFont(.manropeRegular, 18)
    
    // Body Medium
    static let bodyMediumSemiBold = getFont(.manropeSemiBold, 16)
    static let bodyMediumMedium = getFont(.manropeMedium, 16)
    static let bodyMediumRegular = getFont(.manropeRegular, 16)
    
    // Body Small
    static let bodySmallSemiBold = getFont(.manropeSemiBold, 14)
    static let bodySmallMedium = getFont(.manropeMedium, 14)
    static let bodySmallRegular = getFont(.manropeRegular, 14)
    
    // Body XSmall
    static let bodyXSmallSemiBold = getFont(.manropeSemiBold, 12)
    static let bodyXSmallMedium = getFont(.manropeMedium, 12)
    static let bodyXSmallRegular = getFont(.manropeRegular, 12)
    
    // Body 2XSmall
    static let body2XSmallSemiBold = getFont(.manropeSemiBold, 10)
    static let body2XSmallMedium = getFont(.manropeMedium, 10)
    static let body2XSmallRegular = getFont(.manropeRegular, 10)
    
}

extension Font {
    static func getFont(_ name: String, _ size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}
