//
//  FeaturePlacesScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/05/2025.
//

import SwiftUI

struct FeaturePlacesScreen: View {
    let data = FeaturedCardModel.sampleData
    
    var body: some View {
        NavigationBarContainer {
            VStack {
                cardsSection
            }.padding(.top, 10)
        }.withNavigationBar(title: "Feature Destination") {
            
        }
    }
    
    private var rows: [[FeaturedCardModel]] {
        return stride(from: 0, to: data.count, by: 2).map { index in
            Array(data[index..<min(index + 2, data.count)])
        }
    }
    
    private var cardsSection: some View {
        return ScrollView(.vertical) {
            Grid(horizontalSpacing: .padding12, verticalSpacing: .padding12) {
                ForEach(rows.indices, id: \.self) { rowIndex in
                    let row = rows[rowIndex]
                    FeaturePlacesScreenRow(data: row)
     
                }
            }
            .padding(.horizontal, .padding16)
        }
    }
    
}

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
    FeaturePlacesScreen()
}
