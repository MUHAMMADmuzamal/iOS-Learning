//
//  Gradient + Extension.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 01/01/2024.
//

import SwiftUI
extension Gradient{
    static let oceanBlue =  LinearGradient(
                                gradient: Gradient(colors: [Color(hex: 0xA0DAFB, alpha: 1),
                                                            Color(hex: 0x0A8ED9, alpha: 1)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
}
