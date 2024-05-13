//
//  AsyncHomeScreenVM.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 21/03/2024.
//

import Foundation
protocol AsyncHomeScreenVMProtocol {
    func fetchWeatherData() async
}
class AsyncHomeScreenVM: AsyncHomeScreenVMProtocol {
    var homeRepository: AsyncHomeRepositoryProtocol
    init(homeRepository: AsyncHomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    func fetchWeatherData() async {
      let response = await self.homeRepository.getWeatherData()
        switch response {
        case .success(let model):
            debugPrint(model)
        case.failure(let error):
            debugPrint(error)
        }
    }
}
