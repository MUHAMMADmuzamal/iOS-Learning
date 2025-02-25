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

// MARK: - UserElement
struct UserElement: Codable {
    let createdAt, name: String?
    let avatar: String?
    let accessToken, refreshToken, id: String?
}

typealias User = [UserElement]

class NetworkService {
    let client: HTTPClient = URLSession.shared
    func request() -> AnyPublisher<User, ServerError> {
        var apiRequest: URLRequest = URLRequest(url: URL(string: "https://dummyjson.com/c/9c21-3664-49d1-ab17")!)
        return client.performRequest(apiRequest)
            .mapError({ error in
                ServerError(title: "Network Error", description: error.localizedDescription)
            })
            .flatMap { (data: Data, response: URLResponse) -> AnyPublisher<User, ServerError> in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    return Fail(error: ServerError(title: "Not in range", description: nil)).eraseToAnyPublisher()
                }
                do {
                    let decodeData = try JSONDecoder().decode(User.self, from: data)
                    return Just(decodeData)
                        .setFailureType(to: ServerError.self)
                        .eraseToAnyPublisher()
                }catch {
                    return Fail(error: ServerError(title: "Json parse error", description: error.localizedDescription.debugDescription)).eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}



protocol HTTPClient {
    func performRequest(_ request: URLRequest) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error>
}

extension URLSession: HTTPClient {
    struct InValidHTTPResponseError: Error {}
    
    func performRequest(_ request: URLRequest) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        let session = URLSession.shared
        return session.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw InValidHTTPResponseError()
                }
                return (data, response)
            }.eraseToAnyPublisher()
    }
}
