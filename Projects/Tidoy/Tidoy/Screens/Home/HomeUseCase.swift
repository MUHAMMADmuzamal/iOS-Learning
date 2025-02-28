//
//  HomeUseCase.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
    func loadHomeData() -> AnyPublisher<[HomeDTO], AppError>
}

final class HomeUseCase: HomeUseCaseProtocol {
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func loadHomeData() -> AnyPublisher<[HomeDTO], AppError> {
        return service.loadHomeData()
    }
}
