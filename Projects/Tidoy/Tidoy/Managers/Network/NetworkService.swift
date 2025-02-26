//
//  NetworkProvider.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/02/2025.
//

import Foundation
import Combine

struct ServerError: Error {
    let title: String
    let description: String?
}

protocol HTTPClient {
    func performRequest(_ request: URLRequestProtocol) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error>
}

extension URLSession: HTTPClient {
    struct InValidHTTPResponseError: Error {}
    
    func performRequest(_ request: URLRequestProtocol) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        let session = URLSession.shared
        return session.dataTaskPublisher(for: request.request)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw InValidHTTPResponseError()
                }
                return (data, response)
            }.eraseToAnyPublisher()
    }
}
