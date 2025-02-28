//
//  HomeRepository.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func fetchHomeData() -> AnyPublisher<[HomeDTO], AppError>
}

final class HomeRepository: HomeRepositoryProtocol {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchHomeData() -> AnyPublisher<[HomeDTO], AppError> {
        return client.performRequest(HomeURLRequestFactory.makeHomeURLRequest())
            .tryMap(HomeMapper.map)
            .mapError { error in
                if let apiError = error as? APIError {
                    return AppError.api(apiError)
                } else {
                    return .network(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
