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
    let urlSession = URLSession.shared
    func request() -> AnyPublisher<User, ServerError> {
        var apiRequest: URLRequest = URLRequest(url: URL(string: "https://dummyjson.com/c/9c21-3664-49d1-ab17")!)
        return urlSession.dataTaskPublisher(for: apiRequest)
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
    
    
//    func request() -> AnyPublisher<User, ServerError> {
//        var apiRequest: URLRequest = URLRequest(url: URL(string: "https://dummyjson.com/c/9c21-3664-49d1-ab17")!)
//        return urlSession.dataTaskPublisher(for: apiRequest)
//            .tryMap { (data: Data, response: URLResponse) -> Data in
//                guard let httpResponse = response as? HTTPURLResponse, 100..<200 ~= httpResponse.statusCode else {
//                    throw ServerError(title: "Not in range", description: nil)
//                }
//                return data
//            }
//            .decode(type: User.self, decoder: JSONDecoder())
//            .mapError({ error in
//                ServerError(title: "Json parse error", description: error.localizedDescription)
//            })
//            .eraseToAnyPublisher()
//    }
}
