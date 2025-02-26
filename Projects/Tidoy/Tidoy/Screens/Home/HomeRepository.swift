//
//  HomeRepository.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func fetchHomeData() -> AnyPublisher<[UserElement], Error>
}

final class HomeRepository: HomeRepositoryProtocol {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchHomeData() -> AnyPublisher<[UserElement], any Error> {
        return client.performRequest(HomeURLRequestFactory.makeHomeURLRequest())
            .tryMap(HomeMapper.map)
            .eraseToAnyPublisher()
    }
}
