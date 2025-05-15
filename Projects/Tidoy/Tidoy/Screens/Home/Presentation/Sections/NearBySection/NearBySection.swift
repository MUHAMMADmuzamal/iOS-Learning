//
//  NearBySection.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct NearBySection: View {

    let showAll: () -> Void
    let tapOnCard: (NearByCardModel) -> Void
    let housesList:[NearByCardModel]
    var body: some View {
        VStack(spacing: 16) {
            HomeSectionHeader(showAllDidTap: showAll, title: "Near by")
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
                ForEach(housesList) { data in
                    NearByCard(model: data, height: .nearByCardHeight, width: .nearByCardWidth)
                        .onTapGesture {
                            tapOnCard(data)
                        }
                }
            }
        }
        .padding(.leading, .padding16)
    }
}

#Preview {
    ZStack {
        Color.background10
        NearBySection(showAll: {}, tapOnCard: { _ in} ,housesList: NearByCardModel.sampleDataList)
    }
}

