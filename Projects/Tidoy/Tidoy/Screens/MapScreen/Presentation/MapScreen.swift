//
//  MapScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 24/04/2025.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @State private var position: MapCameraPosition = .automatic
    private let locations: [DefaultCardModel] = DefaultCardModel.sampleDataList
    private let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            MapView(locations: DefaultCardModel.mapSampleData, position: $position)
            
            VStack {
                backButtonSection
            
                Spacer()
                
                cardSection
            }
        }
    }
    
    private var cardSection: some View {
        ScrollView(.horizontal) {
            HStack(spacing: .padding12) {
                ForEach(locations) { data in
                    DefaultCard(height: 172, width: screenWidth - .padding32, model: data)
                        .onTapGesture {
                            position = .camera(
                                MapCamera(
                                    centerCoordinate: data.coordinates,
                                    distance: 800,
                                    heading: 0,
                                    pitch: 45
                                )

                            )
                        }
                }
            }
            .padding(.leading, .padding12)
        }
    }
    
    private var backButtonSection: some View {
        HStack(alignment: .center) {
            BackButton() {}
                .padding(.leading, .padding16)
            Spacer()
        }
    }
}

#Preview {
    MapScreen()
}
