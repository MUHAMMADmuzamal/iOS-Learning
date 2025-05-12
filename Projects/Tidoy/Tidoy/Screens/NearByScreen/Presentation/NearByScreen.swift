//
//  NearByScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import SwiftUI

struct FilterModel {
    let id: String = UUID().uuidString
    let title: String
    var isSelected: Bool
}

struct NearByScreen: View {
    let data = NearByCardModel.sampleDataList
    @State var filters: [FilterModel] = [
        FilterModel(title: "All", isSelected: true),
        FilterModel(title: "Recommend", isSelected: false),
        FilterModel(title: "Popular", isSelected: false),
        FilterModel(title: "Best Price", isSelected: false),
        FilterModel(title: "Best Price", isSelected: false),
        FilterModel(title: "Best Price", isSelected: false),
    ]
    
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
        let data = NearByCardModel.sampleDataList
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

struct FilterCell: View {
    let model: FilterModel
    let action: (FilterModel) -> Void
    private let height = 30.0
    private let cornerRadius = 30.0 / 2

    var body: some View {
        Button(action: {
            action(model)
        }) {
            Text(model.title)
                .font(.body2XSmallRegular)
                .padding(.vertical, .padding8)
                .padding(.horizontal, .padding12)
                .frame(height: height)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
    }
    
    private var backgroundColor: Color {
        model.isSelected ? .background20 : .background10
    }

    private var borderColor: Color {
        model.isSelected ? .clear : .stroke40
    }
}

struct FilterButton: View {
    let action: () -> Void
    private let height = 30.0
    private let cornerRadius = 30.0 / 2
    @State private var selected = false

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: .padding4) {
                Image("filterIcon")
                    .foregroundStyle(Color.icon100)
                Text("Filter")
                    .font(.body2XSmallRegular)
            }
            .padding(.vertical, .padding8)
            .padding(.horizontal, .padding12)
            .frame(height: height)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: 1)
            )
            .overlay {
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color.dangerMain)
                        .frame(height: 16)
                        .overlay {
                            Text("99")
                                .font(Font.body2XSmallRegular)
                        }
                        .offset(y: -15)
                        .padding(.trailing, .padding4)
                        
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var backgroundColor: Color {
        selected ? .background20 : .background10
    }

    private var borderColor: Color {
        selected ? .clear : .stroke40
    }
}

struct BackButtonView: View {
    let action: () -> Void
    var color: Color = .icon100
    var text: String

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "chevron.left")
                    .frame(width: 24, height: 24)
                Text(text)
            }
            .foregroundStyle(color)
        }
    }
}

