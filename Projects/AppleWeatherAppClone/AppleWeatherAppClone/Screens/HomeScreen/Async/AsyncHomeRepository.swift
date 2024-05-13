//
//  AsyncHomeRepository.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 21/03/2024.
//

import Foundation
protocol AsyncHomeRepositoryProtocol {
    func getWeatherData() async -> Result<WeatherData, Error>
}
class AsyncHomeRepository: AsyncHomeRepositoryProtocol {
    var homeNetworkProvider: AsyncHomeNetworkProvider
    init(homeNetworkProvider: AsyncHomeNetworkProvider) {
        self.homeNetworkProvider = homeNetworkProvider
    }
    func getWeatherData() async -> Result<WeatherData, Error> {
        return await self.homeNetworkProvider.getWeatherData()
    }
}
