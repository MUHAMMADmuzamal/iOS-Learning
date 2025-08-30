//
//  NearByScreenRow.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import SwiftUI

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

#Preview {
    Grid {
        NearByScreenRow(data: NearByCardModel.sampleDataList)
    }
}
