//
//  Tabs.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 29/05/2024.
//

import SwiftUI

enum Tabs: String, CaseIterable {
    case home, location, cart, profile, detail
    var icon: Image {
        switch self {
        case .home:
            return Image("homeIcon")
        case .location:
            return Image("locationIcon")
        case .cart:
            return Image("cartIcon")
        case .profile:
            return Image("profileIcon")
        case .detail:
            return Image("detailIcon")
        }
    }
    var selectedColor: LinearGradient {
        LinearGradient(colors: [Color("skyblueE9"), Color("purpleED")], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var unSelectedColor: LinearGradient {
        LinearGradient(colors: [Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
