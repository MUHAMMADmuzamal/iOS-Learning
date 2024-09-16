//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Codes Orbit on 14/09/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    
    private var cancelBag = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // below function is no need because  $searchText.combineLatest(dataService.$allCoins) use it and do same thing.
//        dataService.$allCoins
//            .sink {[weak self] (returnCoins) in
//                self?.allCoins = returnCoins
//            }.store(in: &cancelBag)
        
        // update allCoins
        $searchText.combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }.store(in: &cancelBag)
        
        //update market data
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }.store(in: &cancelBag)
    }
    
    private func filterCoins(text: String, cons:[CoinModel]) -> [CoinModel] {
        
        guard !text.isEmpty else { return cons }
        
        let lowercaseText = text.lowercased()
        
        return cons.filter({ (coin) -> Bool in
            coin.name.lowercased().contains(lowercaseText) ||
            coin.symbol.lowercased().contains(lowercaseText)  ||
            coin.id.lowercased().contains(lowercaseText)
        })
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketDataModel else {
            return stats
        }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        
        let btcDominance = StatisticModel(title: "BTC Dominace", value: data.btcDominance)
        
        let portfolio =  StatisticModel(title: "Portfoilo", value: "$0.00", percentageChange: 0)
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
