//
//  NearBySection.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct NearBySection: View {
    let height: Double = 148
    let width: Double = 165
    
    let housesList:[NearByCardModel]
    var body: some View {
        VStack {
            headingSection
            cardsList
        }
        .padding(.vertical, 5)
        .background {
            Color.background10
        }
        
    }
    
    private var headingSection: some View {
        HStack {
            Text("NearBy")
                .font(.bodySmallSemiBold)
            Spacer()
            Button {
                
            } label: {
                Text("Show all")
                    .font(.body2XSmallSemiBold)
                    .underline()
            }
        }
        .foregroundStyle(Color.text100)
        .padding(.horizontal, 16)
    }
    
    private var cardsList: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(housesList) { data in
                    NearByCard(model: data, height: height, width: width)
                }
            }
        }
        .padding(.leading, 16)
    }
}

#Preview {
    NearBySection(housesList: NearByCardModel.sampleDataList)
}

