//
//  HomeNetworkProvider.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
protocol HomeNetworkProvierProtocol {
    func getWeatherData(completion: @escaping (Result<WeatherData, Error>) -> Void)
}
class HomeNetworkProvider: NetworkProvider, HomeNetworkProvierProtocol {
    func getWeatherData(completion: @escaping (Result<WeatherData, Error>) -> Void) {
        self.request(GetWeatherDataAPI(), completion: completion)
    }
}
