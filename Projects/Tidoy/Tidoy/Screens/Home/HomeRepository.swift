//
//  HomeRepository.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func fetchHomeData() -> AnyPublisher<HomeResponseDTO, AppError>
}

final class HomeRepository: HomeRepositoryProtocol {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchHomeData() -> AnyPublisher<HomeResponseDTO, AppError> {
        return client.performRequest(HomeURLRequestFactory.makeHomeURLRequest())
            .tryMap(HomeMapper.map)
            .mapError { error -> APIError in
                    print("❌❌❌ Error occurred in mapError ❌❌❌")
                    print(error)
                    print("❌❌❌❌❌❌❌❌❌❌")
                return .invalidResponse // Default fallback error
                }
                .catch { error -> AnyPublisher<HomeResponseDTO, AppError> in
                    print("❌❌❌ Error occurred in catch ❌❌❌")
                    print(error)
                    print("❌❌❌❌❌❌❌❌❌❌")
                    return Fail(error: AppError.api(error)).eraseToAnyPublisher()
                }
            .eraseToAnyPublisher()
    }
}
