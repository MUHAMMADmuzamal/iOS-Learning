//
//  HomeService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation
import Combine

protocol HomeServiceProtocol {
    func loadHomeData() -> AnyPublisher<[UserElement], Error>
}

class HomeService: HomeServiceProtocol {
    
    let repository: HomeRepositoryProtocol
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadHomeData() -> AnyPublisher<[UserElement], Error> {
        return repository.fetchHomeData()
    }
}
