//
//  TabBarModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 08/04/2025.
//

import SwiftUI

enum TabBarItems: Int, CaseIterable {
    case home = 1, wishList, stay, profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .wishList:
            return "WishList"
        case .stay:
            return "Stay"
        case .profile:
            return "Profile"
        }
    }
    
    var selectedImage: some View {
        
        var name = ""
        
        switch self {
        case .home:
            name = "home.selected"
        case .wishList:
            name = "wishList.selected"
        case .stay:
            name = "stay.selected"
        case .profile:
            name = "profile.selected"
        }
        
        return Image(name)
            .foregroundStyle(Color.icon90)
    }
    
    var unselectedImage: some View {
        
        var name = ""
        
        switch self {
        case .home:
            name = "home.unSelected"
        case .wishList:
            name = "wishList.unSelected"
        case .stay:
            name = "stay.unSelected"
        case .profile:
            name = "profile.unSelected"
        }
        
        return Image(name)
            .foregroundStyle(Color.icon90)
    }
}
