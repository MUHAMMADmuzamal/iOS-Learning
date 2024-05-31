//
//  GradientExtension.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 24/05/2024.
//

import SwiftUI

extension LinearGradient {
    //Tabbar
    static var tabBarLinearGradient = LinearGradient(colors: [Color("gray51"), Color("gray51")], startPoint: .top, endPoint: .bottom)
    static var tabBarLinearGradient2 = LinearGradient(stops: [.init(color: Color("gray51"), location: 0), .init(color: Color("gray24"), location: 1)], startPoint: .top, endPoint: .bottom)
    
    static var tabStrokeLinearGradient = LinearGradient(stops:[.init(color: Color.white, location: 0), .init(color: Color.black, location: 1) ], startPoint: .top, endPoint: .bottom)   
    
    //Home
    static var homeBackgroundLinearGradient = LinearGradient(stops: [.init(color: Color("skyblueE9"), location: 0), .init(color: Color("purpleED"), location: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static var homeTopSectionBackgroundLinearGradient = LinearGradient(stops: [.init(color: Color.gray54, location: 0), .init(color: Color.gray34, location: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)

}
