//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Codes Orbit on 15/09/2024.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var cancelBag = Set<AnyCancellable>()
    
    private let dataService: CoinImageService
    private let coin: CoinModel
    
    init(coin: CoinModel){
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscribers()
    }
    
    private func addSubscribers() {
        self.dataService.$image.sink { [weak self]_ in
            self?.isLoading = false
        } receiveValue: {[weak self] (returnedImage) in
            self?.image = returnedImage
        }.store(in: &cancelBag)
    }
}
