//
//  VeganRestaurantModel.swift
//  FoodDelivery
//
//  Created by codes orbit on 19/09/2023.
//

import Foundation
struct VeganRestaurantModel {
    let coverImage: String
    let restaurantName: String
    let categoryTags: String
}

let veganRestaurantMockData = [
    VeganRestaurantModel(coverImage: "vegan_img1", restaurantName: "Punjabi Dhaba 35", categoryTags: "North Indian, Punjabi"),
    VeganRestaurantModel(coverImage: "vegan_img2", restaurantName: "Bittu Da Dhabha", categoryTags: "North India"),
    VeganRestaurantModel(coverImage: "vegan_img3", restaurantName: "The Rice Junction", categoryTags: "Indian"),
    VeganRestaurantModel(coverImage: "vegan_img4", restaurantName: "The Food Garden", categoryTags: "Pizza, Fast Food, Italian-American")
]
