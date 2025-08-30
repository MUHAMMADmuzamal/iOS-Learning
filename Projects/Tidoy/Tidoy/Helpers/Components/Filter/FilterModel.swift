//
//  FilterModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/05/2025.
//

import Foundation

struct FilterModel {
    let id: String = UUID().uuidString
    let title: String
    var isSelected: Bool
}

extension FilterModel {
    static let sampleData = [
        FilterModel(title: "All", isSelected: true),
        FilterModel(title: "Recommend", isSelected: false),
        FilterModel(title: "Popular", isSelected: false),
        FilterModel(title: "Best Price", isSelected: false),
        FilterModel(title: "Best Price", isSelected: false),
        FilterModel(title: "Best Price", isSelected: false),
    ]
}
