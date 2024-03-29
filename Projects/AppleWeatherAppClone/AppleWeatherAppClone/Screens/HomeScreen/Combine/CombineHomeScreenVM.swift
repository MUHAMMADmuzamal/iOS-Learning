//
//  CombineHomeScreenVM.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 29/03/2024.
//

import Foundation
import Combine

protocol CombineHomeScreenVMProtocol {
    func fetchWeatherData()
}
class CombineHomeScreenVM: CombineHomeScreenVMProtocol {
    var homeRepository: CombineHomeRepositoryProtocol
    var cancelable = Set<AnyCancellable>()
    init(homeRepository: CombineHomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func fetchWeatherData() {
      let response = self.homeRepository.getWeatherData()
        response.sink { error in
            debugPrint("error")
        } receiveValue: { data in
            switch data {
            case .success(let model):
                debugPrint(model)
            case.failure(let error):
                debugPrint(error)
            }
        }.store(in: &cancelable)

    }
}
