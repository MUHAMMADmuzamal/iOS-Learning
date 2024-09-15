//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Codes Orbit on 14/09/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    
    private var cancelBag = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink {[weak self] (returnCoins) in
                self?.allCoins = returnCoins
            }.store(in: &cancelBag)
    }
}
