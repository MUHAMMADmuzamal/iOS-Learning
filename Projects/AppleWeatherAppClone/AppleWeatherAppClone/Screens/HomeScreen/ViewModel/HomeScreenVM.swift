//
//  HomeScreenVM.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 18/03/2024.
//

import Foundation
import Combine
protocol HomeScreenVMProtocol {
    func fetchWeatherData() async
}
class HomeScreenVM: HomeScreenVMProtocol {
    var homeRepository: HomeRepositoryProtocol
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    func fetchWeatherData() async {
        await self.homeRepository.getWeatherData(completion: { result in
            switch result {
            case .success(let model):
                debugPrint(model)
            case .failure(let error):
                debugPrint(error)
            }
        })
    }
}
