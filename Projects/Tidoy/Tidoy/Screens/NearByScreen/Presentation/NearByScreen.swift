//
//  NearByScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import SwiftUI

struct NearByScreen: View {
    let data = NearByCardModel.sampleDataList
    @State var filters: [FilterModel] = FilterModel.sampleData
    
    var body: some View {
        
        NavigationBarContainer {
            VStack {
                HStack(spacing: .padding8) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: .padding8) {
                            ForEach(filters, id: \.id) { model in
                                FilterCell(model: model){ selectedModel in
                                    for index in filters.indices {
                                        let model = filters[index]
                                        if model.id == selectedModel.id {
                                            filters[index].isSelected = true
                                        } else {
                                            filters[index].isSelected = false
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 50)
                    }
                    Spacer()
                    FilterButton() {}
                }
                .padding(.horizontal, .padding16)
                Rectangle()
                    .fill(Color.stroke40)
                    .frame(height: 1)
                    
                    
                cardsSection
            }
        }
        .withNavigationBar(title: "Screen Title", backAction: { print("Back tapped") })
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var cell: some View {
        Color.background10
            .ignoresSafeArea()
    }
    
    private var rows: [[NearByCardModel]] {
        return stride(from: 0, to: data.count, by: 2).map { index in
            Array(data[index..<min(index + 2, data.count)])
        }
    }
    
    private var cardsSection: some View {
        return ScrollView(.vertical) {
            Grid(horizontalSpacing: .padding12, verticalSpacing: .padding12) {
                ForEach(rows.indices, id: \.self) { rowIndex in
                    let row = rows[rowIndex]
                    NearByScreenRow(data: row)
     
                }
            }
            .padding(.horizontal, .padding16)
        }
    }
}

#Preview {
    NavigationStack {
        NearByScreen()
    }
}

struct NearByScreenRow: View {
    
    let data: [NearByCardModel]
    let width = (UIScreen.screenWidth / 2) - .padding16
    
    var body: some View {
        GridRow {
            
            ForEach(data, id: \.id) { item in
                NearByCard(model: item, height: .nearByCardHeight, width: width)
            }
            
            if data.count == 1 {
                Spacer() // Maintain 2-column layout
            }
        }
    }
}

