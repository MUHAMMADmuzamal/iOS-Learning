//
//  NetworkProvider.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/02/2025.
//

import Foundation
import Combine

protocol HTTPClient {
    func performRequest(_ request: Endpoint) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error>
}

class NetworkService: HTTPClient {
    let networkMonitoringService: NetworkMonitoringService
    
    init(networkMonitoringService: NetworkMonitoringService) {
        self.networkMonitoringService = networkMonitoringService
    }
    
    func performRequest(_ request: Endpoint) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        
        guard self.networkMonitoringService.isReachable else {
            return .fail(AppError.network)
        }
        
        let session = URLSession.shared
        return session.dataTaskPublisher(for: request.request)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                print(String(data: data, encoding: .utf8) as Any)
                return (data, response)
            }.eraseToAnyPublisher()
    }
}

// with this approach i can not monitor network.
extension URLSession: HTTPClient {
    
    func performRequest(_ request: Endpoint) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        let session = URLSession.shared
        return session.dataTaskPublisher(for: request.request)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.invalidResponse
                }
                return (data, response)
            }.eraseToAnyPublisher()
    }
}
