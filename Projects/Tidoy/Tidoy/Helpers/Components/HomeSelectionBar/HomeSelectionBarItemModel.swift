//
//  HomeSelectionBarItemModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/03/2025.
//

import Foundation

struct HomeSelectionBarItemModel: Identifiable {
    let id: String
    let title: String
    let iconName: String
    var isSelected: Bool
    
    init(id: String, title: String, iconName: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.iconName = iconName
        self.isSelected = isSelected
    }
    
    init(title: String, iconName: String, isSelected: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.iconName = iconName
        self.isSelected = isSelected
    }
}

extension HomeSelectionBarItemModel {
    static var selectionBarItemsList: [HomeSelectionBarItemModel] = [
        HomeSelectionBarItemModel(title: "All", iconName: "allIcon", isSelected: false),
        HomeSelectionBarItemModel(title: "House", iconName: "houseIcon", isSelected: false),
        HomeSelectionBarItemModel(title: "Villa", iconName: "villaIcon", isSelected: true),
        HomeSelectionBarItemModel(title: "Apartment", iconName: "apartmentIcon", isSelected: false),
        HomeSelectionBarItemModel(title: "Hotels", iconName: "hotelsIcon", isSelected: false),
    ]
}
