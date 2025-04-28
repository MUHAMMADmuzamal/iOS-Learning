//
//  MapView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/04/2025.
//

import SwiftUI
import MapKit

struct MapViewDataModel: Identifiable {
    let id: String
    let price: Int
    let priceUnit: String
    let coordinates: CLLocationCoordinate2D
    
    init(id: String, price: Int, priceUnit: String, coordinates: CLLocationCoordinate2D) {
        self.id = id
        self.price = price
        self.priceUnit = priceUnit
        self.coordinates = coordinates
    }
    
    init(_ model: DefaultCardModel) {
        self.id = UUID().uuidString
        self.price = model.price
        self.priceUnit = model.priceUnit
        self.coordinates = model.coordinates
    }
}

struct MapView: View {
    
    let locations: [MapViewDataModel]
    
    @Binding var position: MapCameraPosition
    
    var body: some View {
        Map(position: $position) {
            ForEach(locations) { place in
                Annotation("", coordinate: place.coordinates) {
                    VStack {
                        Text("\(place.priceUnit) \(place.price)")
                            .font(.bodySmallMedium)
                            .padding(.horizontal, .padding8)
                            .padding(.vertical, .padding4)
                    }
                    .background(Color.background10)
                    .clipShape(RoundedRectangle(cornerRadius: .cornerRadius2XS))
                    .overlay {
                        RoundedRectangle(cornerRadius: .cornerRadius2XS)
                        .stroke(lineWidth: 1)
                        .fill(Color.stroke50)
                    }
                }
            }
        }
    }
}

#Preview {
    MapView(locations: DefaultCardModel.mapSampleData, position: .constant(.automatic))
}
