//
//  FeaturePlacesScreenRow.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import SwiftUI

struct FeaturePlacesScreenRow: View {
    
    let data: [FeaturedCardModel]
    let width = (UIScreen.screenWidth / 2) - .padding16
    
    var body: some View {
        GridRow {
            
            ForEach(data, id: \.id) { item in
                FeaturedCard(model: item)
                    .frame(width: 175, height: 234)
            }
            
            if data.count == 1 {
                Spacer() // Maintain 2-column layout
            }
        }
    }
}

#Preview {
    FeaturePlacesScreenRow(data: FeaturedCardModel.sampleData)
}
