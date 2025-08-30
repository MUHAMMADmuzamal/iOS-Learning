//
//  HomeUseCase.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
    func loadHomeData() -> AnyPublisher<HomeResponseDTO, AppError>
}

final class HomeUseCase: HomeUseCaseProtocol {
    let repository: HomeRepositoryProtocol
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadHomeData() -> AnyPublisher<HomeResponseDTO, AppError> {
        return repository.fetchHomeData()
    }
}
