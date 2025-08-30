//
//  Double + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import Foundation

extension Double {
    static let nearByCardHeight: Double = 236
    static let nearByCardWidth: Double = 165
    
    /// Returns a responsive value based on design dimensions and current screen size.
    func responsive(basedOn designDimension: CGFloat, current actualDimension: CGFloat) -> CGFloat {
        return (self / designDimension) * actualDimension
    }
}
