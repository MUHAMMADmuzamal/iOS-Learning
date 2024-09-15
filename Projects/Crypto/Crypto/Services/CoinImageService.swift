//
//  CoinImageService.swift
//  Crypto
//
//  Created by Codes Orbit on 15/09/2024.
//

import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage(url: coin.image)
    }
    
    private func getCoinImage(url: String) {
        guard let url = URL(string: url) else { return }
        
        imageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnImage) in
                self?.image = returnImage
                self?.imageSubscription?.cancel()
            })
    }
}
