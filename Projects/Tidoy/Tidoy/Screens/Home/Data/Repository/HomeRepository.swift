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
            .mapError { error in
                return  (error as? AppError) ?? UnknownError(title: "Unknown Error",
                                                             message: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
