//
//  CombineHomeNetworkProvider.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 29/03/2024.
//

import Foundation
import Combine

protocol CombineHomeNetworkProviderProtocol {
    func getWeatherData() -> AnyPublisher<WeatherData, Error>
}
class CombineHomeNetworkProvider: CombineNetworkProvider, CombineHomeNetworkProviderProtocol {
    
    func getWeatherData() -> AnyPublisher<WeatherData, Error> {
        return  self.request(GetWeatherDataAPI())
    }
}
