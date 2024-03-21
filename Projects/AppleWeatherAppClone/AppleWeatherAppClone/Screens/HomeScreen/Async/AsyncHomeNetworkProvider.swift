//
//  AsyncHomeNetworkProvider.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 21/03/2024.
//

import Foundation
protocol AsyncHomeNetworkProviderProtocol {
    func getWeatherData() async -> Result<WeatherData, Error>
}
class AsyncHomeNetworkProvider: AsyncNetworkProvider, AsyncHomeNetworkProviderProtocol {
    func getWeatherData() async -> Result<WeatherData, Error> {
        return await self.request(GetWeatherDataAPI())
    }
}
