//
//  HomeRepository.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
protocol HomeRepositoryProtocol {
    func getWeatherData(completion: @escaping (Result<WeatherData, Error>) -> Void)
}
class HomeRepository: HomeRepositoryProtocol {
    var homeNetworkProvider: HomeNetworkProvierProtocol
    init(homeNetworkProvider: HomeNetworkProvierProtocol) {
        self.homeNetworkProvider = homeNetworkProvider
    }
    func getWeatherData(completion: @escaping (Result<WeatherData, Error>) -> Void) {
        self.homeNetworkProvider.getWeatherData(completion: completion)
    }
}
