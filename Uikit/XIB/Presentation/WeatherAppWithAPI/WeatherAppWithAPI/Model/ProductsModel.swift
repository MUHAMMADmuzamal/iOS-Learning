//
//  ProductModel.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 05/09/2023.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    var products: [Product]
    var total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
