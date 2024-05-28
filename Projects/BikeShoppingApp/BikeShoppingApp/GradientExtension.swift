//
//  GradientExtension.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 24/05/2024.
//

import SwiftUI

extension LinearGradient {
    static var tabBarLinearGradient = LinearGradient(colors: [Color("gray51"), Color("gray51")], startPoint: .top, endPoint: .bottom)
    static var tabBarLinearGradient2 = LinearGradient(stops: [.init(color: Color("gray51"), location: 0), .init(color: Color("gray24"), location: 1)], startPoint: .top, endPoint: .bottom)
    
    static var tabStrokeLinearGradient = LinearGradient(stops:[.init(color: Color.white, location: 0), .init(color: Color.black, location: 1) ], startPoint: .top, endPoint: .bottom)
}
