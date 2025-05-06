//
//  NearByCardModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct NearByCardModel: Identifiable {
    let id: String
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
    let isAvailable: Bool
    
    init(
        id: String = UUID().uuidString,
        imageURL: String,
        isFavorite: Bool,
        nameOfHouse: String,
        addressOfHouse: String,
        rating: Double,
        distance: Int,
        distanceUnit: String,
        price: Int,
        priceUnit: String,
        duration: String,
        isAvailable: Bool
    ) {
        self.id = id
        self.imageURL = imageURL
        self.isFavorite = isFavorite
        self.nameOfHouse = nameOfHouse
        self.addressOfHouse = addressOfHouse
        self.rating = rating
        self.distance = distance
        self.distanceUnit = distanceUnit
        self.price = price
        self.priceUnit = priceUnit
        self.duration = duration
        self.isAvailable = isAvailable
    }
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
        duration: "night",
        isAvailable: true
    )

    static let sampleDataList: [NearByCardModel] = [
        NearByCardModel(
            imageURL: "https://images.unsplash.com/photo-1554995207-c18c203602cb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw1fHxob3VzZXxlbnwwfHx8fDE3NDI1NjcyMTZ8MA&ixlib=rb-4.0.3&q=80&w=400",
            isFavorite: false,
            nameOfHouse: "Sunset Villa",
            addressOfHouse: "Bali, Indonesia",
            rating: 4.8,
            distance: 10,
            distanceUnit: "km",
            price: 200,
            priceUnit: "$",
            duration: "night",
            isAvailable: true
        ),
        NearByCardModel(
            imageURL: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
            isFavorite: true,
            nameOfHouse: "Mountain Retreat",
            addressOfHouse: "Swiss Alps, Switzerland",
            rating: 4.9,
            distance: 50,
            distanceUnit: "km",
            price: 300,
            priceUnit: "$",
            duration: "night",
            isAvailable: true
        ),
        NearByCardModel(
            imageURL: "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw2fHxob3VzZXxlbnwwfHx8fDE3NDI1NjcyMTZ8MA&ixlib=rb-4.0.3&q=80&w=400",
            isFavorite: false,
            nameOfHouse: "Cozy Apartment",
            addressOfHouse: "Paris, France",
            rating: 4.5,
            distance: 5,
            distanceUnit: "km",
            price: 120,
            priceUnit: "$",
            duration: "night",
            isAvailable: true
        ),
        NearByCardModel(
            imageURL: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw3fHxob3VzZXxlbnwwfHx8fDE3NDI1NjcyMTZ8MA&ixlib=rb-4.0.3&q=80&w=400",
            isFavorite: true,
            nameOfHouse: "Lake House",
            addressOfHouse: "Ontario, Canada",
            rating: 4.7,
            distance: 20,
            distanceUnit: "km",
            price: 250,
            priceUnit: "$",
            duration: "night",
            isAvailable: false
        ),
        NearByCardModel(
            imageURL: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw3fHxob3VzZXxlbnwwfHx8fDE3NDI1NjcyMTZ8MA&ixlib=rb-4.0.3&q=80&w=400",
            isFavorite: true,
            nameOfHouse: "Lake House",
            addressOfHouse: "Ontario, Canada",
            rating: 4.7,
            distance: 20,
            distanceUnit: "km",
            price: 250,
            priceUnit: "$",
            duration: "night",
            isAvailable: false
        )
    ]
}

