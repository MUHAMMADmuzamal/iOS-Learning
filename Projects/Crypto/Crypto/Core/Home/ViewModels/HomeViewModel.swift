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
    
    @Published var isLoading: Bool = false
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    
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
        
        // update portfolio coins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink {[weak self] (returnedCoins) in
                self?.portfolioCoins = returnedCoins
            }.store(in: &cancelBag)
        
        //update market data
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
                self?.isLoading = false
            }.store(in: &cancelBag)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
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
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        allCoins.compactMap { (coin) -> CoinModel? in
            guard let entity = portfolioEntities.first(where: {$0.coinId == coin.id}) else { return nil}
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCons:[CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        guard let data = marketDataModel else {
            return stats
        }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        
        let btcDominance = StatisticModel(title: "BTC Dominace", value: data.btcDominance)
        
        
        let portfolioValue = portfolioCons.map({$0.currentHoldingsValue}).reduce(0, +)
        
        let previousValue = 
            portfolioCons
                .map { coin -> Double in
                    let currentValue = coin.currentHoldingsValue
                    let percentChange = (coin.priceChangePercentage24H ?? 0) / 100
                    let perviousValue = currentValue / (1 + percentChange)
                    return perviousValue
                }
                .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
        
        let portfolio =  StatisticModel(title: "Portfoilo", value: "\(portfolioValue.asCurrencyWith2Decimals())", percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
