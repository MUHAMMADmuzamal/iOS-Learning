//
//  Color + Extension.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 01/01/2024.
//

import SwiftUI
extension Color{
    static let gray83 = Color(hex: 0x838383, alpha: 1)
    static let gray85 = Color(hex: 0x858585, alpha: 1)
    static let grayD4 = Color(hex: 0xD4D4D4, alpha: 1)
    static let whiteF7 = Color(hex: 0xF7F7F7, alpha: 1)
    static let skyBlueD9 = Color(hex: 0x0A8ED9, alpha: 1)


    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB, red: Double((hex >> 16) & 0xFF) / 255, green: Double((hex >> 8) & 0xFF) / 255, blue: Double(hex & 0xFF) / 255, opacity: alpha)
    }
}
