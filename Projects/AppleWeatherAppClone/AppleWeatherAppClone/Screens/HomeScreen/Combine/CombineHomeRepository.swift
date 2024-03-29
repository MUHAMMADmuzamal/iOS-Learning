//
//  CombineHomeRepository.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 29/03/2024.
//

import Foundation
import Combine

protocol CombineHomeRepositoryProtocol {
    func getWeatherData() -> AnyPublisher<Result<WeatherData, Error>, Never>
}
class CombineHomeRepository: CombineHomeRepositoryProtocol {
    var homeNetworkProvider: CombineHomeNetworkProvider
    init(homeNetworkProvider: CombineHomeNetworkProvider) {
        self.homeNetworkProvider = homeNetworkProvider
    }
    func getWeatherData() -> AnyPublisher<Result<WeatherData, Error>, Never> {
        return self.homeNetworkProvider.getWeatherData()
            .map { data -> Result<WeatherData, Error>  in
                return .success(data)
            }
            .catch({ error -> AnyPublisher<Result<WeatherData, Error>, Never> in
                return .just(.failure(error))
            }).eraseToAnyPublisher()
    }
}
