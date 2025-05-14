//
//  LocationBasedDestinationScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/05/2025.
//

import SwiftUI

struct LocationBasedDestinationScreen: View {
    @State var houseListWithDetail: [DefaultCardModel] = DefaultCardModel.sampleDataList
    @State var filters: [FilterModel] = FilterModel.sampleData
    
    let screenWidth = UIScreen.screenWidth
    
    var body: some View {
        NavigationBarContainer {
            VStack {
                filterSection
                    .padding(.bottom, .padding16)
                cardSection
            }
            .background(background)
        }
        .withCustomNavigationBar {
            navBar
        }
    }
    
    
    private var navBar: some View {
        HStack {
            BackButtonView(action: {}, text: "")
            VStack(alignment: .leading, spacing: .padding4) {
                Text("Bandung, Indonesia")
                    .font(.bodySmallSemiBold)
                    .foregroundStyle(Color.text100)
                Text("167 Recommend Stay")
                    .font(.bodyXSmallRegular)
                    .foregroundStyle(Color.infoMain)
            }
            Spacer()
            SecondaryButton(title: "Change", titleFont: .bodyXSmallSemiBold, cornerRadius: .cornerRadiusXS) {}
                .frame(width: 85, height: 34)
        }
        .padding(.horizontal, .padding16)
        .padding(.bottom, .padding16)
        .background(background)
    }
    
    private var background: some View {
        Color.background10
            .ignoresSafeArea()
    }
    
    private var cardSection: some View {
        ScrollView {
            VStack(spacing: .padding16) {
                ForEach(houseListWithDetail, id: \.id) { item in
                    DefaultCard(height: 172, width: screenWidth - .padding16, model: item)
                }
            }
            .padding(.horizontal, .padding16)
        }
    }
    
    private var filterSection: some View {
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
        }
    }
}

#Preview {
    LocationBasedDestinationScreen()
}
