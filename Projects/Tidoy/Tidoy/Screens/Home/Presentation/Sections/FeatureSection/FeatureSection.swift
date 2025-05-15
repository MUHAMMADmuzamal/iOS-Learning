//
//  FeatureSection.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 22/03/2025.
//

import SwiftUI

struct FeatureSection: View {
    let showAllDidTap: () -> Void
    let placesList: [FeaturedCardModel]
    var body: some View {
        VStack(spacing: 16) {
            HomeSectionHeader(showAllDidTap: showAllDidTap, title: "Featured Destination")
                .frame(height: 40)
                .padding(.top, .padding12)
                .padding(.bottom, .padding8)
            
            cardsList
        }
        .padding(.bottom, .padding12)
    }
    
    private var cardsList: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(placesList) { place in
                    FeaturedCard(model: place)
                        .frame(width: 175, height: 234)
                }
            }
        }
        .padding(.leading, .padding16)
    }
}

#Preview {
    FeatureSection(showAllDidTap: {}, placesList: FeaturedCardModel.sampleData)
}
