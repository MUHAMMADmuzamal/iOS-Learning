//
//  CoinImageView.swift
//  Crypto
//
//  Created by Codes Orbit on 15/09/2024.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject private var viewModel: CoinImageViewModel
    
    init(coin: CoinModel) {
        self._viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image  = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
               ProgressView()
            }else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

//#Preview {
//    CoinImageView()
//}


struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
        .previewLayout(.sizeThatFits)
    }
}
