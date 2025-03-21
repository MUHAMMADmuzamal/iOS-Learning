//
//  NearByCardModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import Foundation

struct NearByCardModel {
    let imageURL: String
    let isFavorite: Bool
    let nameOfHouse: String
    let addressOfHouse: String
    let rating: Double
    let distance: Int
    let distanceUnit: String
    let price: Int
    let priceUnit: String
    let duration: String
}
extension NearByCardModel {
    static let sampleData = NearByCardModel(
     imageURL: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
     isFavorite: true,
     nameOfHouse: "Pasteur Luxury Home",
     addressOfHouse: "Dago Pakar, Bandung",
     rating: 2.5,
     distance: 25,
     distanceUnit: "km",
     price: 150,
     priceUnit: "$",
     duration: "night")
}
