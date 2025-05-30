//
//  DefaultCardModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/03/2025.
//

import Foundation
import MapKit

struct DefaultCardHouseDetail: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    let title: String
}

struct DefaultCardModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let subTitle: String
    let reviewsCount: Int
    let detail:[DefaultCardHouseDetail]
    let price: Int
    let priceUnit: String
    let duration: String
    let isFavorite: Bool
    let image: String
    let rating: Double
    let coordinates: CLLocationCoordinate2D
}

extension DefaultCardModel {
    static let sampleData = DefaultCardModel(
        title: "Villa Family Resort Dago Pakar - View Mountain",
        subTitle: "Dago Pakar, Bandung",
        reviewsCount: 21,
        detail: [
            .init(image: "bed", title: "4 room"),
            .init(image: "bath", title: "2 bath"),
            .init(image: "house", title: "42.0 m²"),
            ],
        price: 251,
        priceUnit: "$",
        duration: "days",
        isFavorite: true,
        image: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
        rating: 4.8,
        coordinates: .init(latitude: 33.7294, longitude: 73.0379)
    )
    
    static let sampleData1 = DefaultCardModel(
        title: "Villa Family Resort Dago Pakar",
        subTitle: "Dago Pakar, Bandung",
        reviewsCount: 21,
        detail: [
            .init(image: "bed", title: "4 room"),
            .init(image: "bath", title: "2 bath"),
            .init(image: "house", title: "42.0 m²"),
            ],
        price: 251,
        priceUnit: "$",
        duration: "days",
        isFavorite: true,
        image: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
        rating: 4.8,
        coordinates: .init(latitude: 33.7294, longitude: 73.0379)
    )
}

extension DefaultCardModel {
    static let sampleDataList: [DefaultCardModel] = [
        DefaultCardModel(
            title: "Villa Family Resort Dago Pakar - View Mountain",
            subTitle: "Dago Pakar, Bandung",
            reviewsCount: 21,
            detail: [
                .init(image: "bed", title: "4 room"),
                .init(image: "bath", title: "2 bath"),
                .init(image: "house", title: "42.0 m²")
            ],
            price: 251,
            priceUnit: "$",
            duration: "days",
            isFavorite: true,
            image: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
            rating: 4.8,
            coordinates: .init(latitude: 33.7518, longitude: 73.0510)
        ),
        DefaultCardModel(
            title: "Luxury Modern House with Pool",
            subTitle: "Seminyak, Bali",
            reviewsCount: 35,
            detail: [
                .init(image: "bed", title: "3 room"),
                .init(image: "bath", title: "3 bath"),
                .init(image: "house", title: "50.0 m²")
            ],
            price: 320,
            priceUnit: "$",
            duration: "days",
            isFavorite: false,
            image: "https://images.unsplash.com/photo-1572120360610-d971b9d7767c?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw0fHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
            rating: 4.9,
            coordinates: .init(latitude: 33.6939, longitude: 73.0652)
        ),
        DefaultCardModel(
            title: "Cozy Minimalist Apartment",
            subTitle: "Jakarta City Center",
            reviewsCount: 18,
            detail: [
                .init(image: "bed", title: "2 room"),
                .init(image: "bath", title: "1 bath"),
                .init(image: "house", title: "35.0 m²")
            ],
            price: 150,
            priceUnit: "$",
            duration: "days",
            isFavorite: false,
            image: "https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw5fHxob3VzZXxlbnwwfHx8fDE3NDQwOTAyNjd8MA&ixlib=rb-4.0.3&q=80&w=400",
            rating: 4.5,
            coordinates: .init(latitude: 33.7016, longitude: 73.0555)
        ),
        DefaultCardModel(
            title: "Seaside Cottage with Ocean View",
            subTitle: "Sanur, Bali",
            reviewsCount: 27,
            detail: [
                .init(image: "bed", title: "5 room"),
                .init(image: "bath", title: "4 bath"),
                .init(image: "house", title: "60.0 m²")
            ],
            price: 410,
            priceUnit: "$",
            duration: "days",
            isFavorite: true,
            image: "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwxMHx8aG91c2V8ZW58MHx8fHwxNzQ0MDkwMjY3fDA&ixlib=rb-4.0.3&q=80&w=400",
            rating: 5.0,
            coordinates: .init(latitude: 33.7476, longitude: 73.1379)
        )
    ]
    
    static let mapSampleData = DefaultCardModel.sampleDataList.map({MapViewDataModel($0)})
}

