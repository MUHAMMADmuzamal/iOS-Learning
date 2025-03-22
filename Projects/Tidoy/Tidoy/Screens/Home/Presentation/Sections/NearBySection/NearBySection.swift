//
//  NearBySection.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct NearBySection: View {
    let height: Double = 236
    let width: Double = 165
    
    let housesList:[NearByCardModel]
    var body: some View {
        VStack(spacing: 16) {
            HomeSectionHeader(title: "Near by")
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
                    NearByCard(model: data, height: height, width: width)
                }
            }
        }
        .padding(.leading, .padding16)
    }
}

#Preview {
    ZStack {
        Color.background10
        NearBySection(housesList: NearByCardModel.sampleDataList)
    }
}

