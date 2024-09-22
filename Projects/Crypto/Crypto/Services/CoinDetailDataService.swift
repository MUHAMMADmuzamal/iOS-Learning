//
//  CoinDetailDataService.swift
//  Crypto
//
//  Created by Codes Orbit on 21/09/2024.
//

import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetail: CoinDetailModel? = nil
    
    let coin: CoinModel
    
    var coinDetailSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinsDetails()
    }
    
    func getCoinsDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        coinDetailSubscription =  NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnCoinDetail) in
                self?.coinDetail = returnCoinDetail
                self?.coinDetailSubscription?.cancel()
            })
    }
}
