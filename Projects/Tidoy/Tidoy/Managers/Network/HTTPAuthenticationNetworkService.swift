//
//  AuthenticationNetworkService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 06/03/2025.
//

import Foundation
import Combine

struct RefreshTokenEndpoint: Endpoint {
    var baseURL: String = .baseURL
    
    var method: HTTPMethod = .POST
    
    var headers: [String: String]? = ["Content-type": "application/json"]
    
    var bodyParams: Data? = nil
    
    var queryParams: [URLQueryItem]?
    
    var path: String = "/refresh-token"
    
    var request: URLRequest {
        var urlComponents: URLComponents = URLComponents(string: baseURL + path)! // base URL + path
        urlComponents.queryItems = queryParams
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method.rawValue
        request.httpBody = bodyParams
        self.headers?.forEach({ (key: String, value: String) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        request.timeoutInterval = 10
        
        request.log() // Only Print to terminal
        
        return request
    }
}

struct RefreshTokenDTO: Encodable {
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
    }
}

struct AccessTokenDTO: Decodable {
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

class HTTPAuthenticationNetworkService: HTTPClient {
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func performRequest(_ request: Endpoint) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        return httpClient.performRequest(request)
            .tryMap(HTTPAuthenticationNetworkServiceMapper.map)
            .tryCatch { error in
                if let apiError = error as? APIError, case .unauthorized = apiError {
                    return try self.refreshToken()
                        .flatMap { _ in self.httpClient.performRequest(request) }
                        .eraseToAnyPublisher()
                } else {
                    throw error
                }
            }
            .eraseToAnyPublisher()

    }
    
    
//    private func refreshToken() throws -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
//        return try self.httpClient.performRequest(
//            RefreshTokenEndpoint(bodyParams: RefreshTokenDTO(refreshToken: "refreshToken").encode()))
//            .eraseToAnyPublisher()
//    }
    private func refreshToken() throws -> AnyPublisher<AccessTokenDTO, Error> {
//            guard !isRefreshingToken else {
//                return refreshTokenSubject.eraseToAnyPublisher()
//            }
//
//            isRefreshingToken = true

            return  httpClient.performRequest(
                RefreshTokenEndpoint(queryParams:
                                        try RefreshTokenDTO(refreshToken:
"""
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0ZXN0dXNlciIsImV4cCI6MTc0MTkzMTU1Mn0.98SfLUw3Q8DN01VATtYKwcNOnXQ5aNNpjy3fVG2SkRA
""").toQueryItems())
            )
            .tryMap { data, _ -> AccessTokenDTO in
                let response = try JSONDecoder().decode(AccessTokenDTO.self, from: data)
//                self.isRefreshingToken = false
//                self.refreshTokenSubject.send(response.accessToken)
//                self.refreshTokenSubject.send(completion: .finished)
                return response
            }
            .catch { error -> AnyPublisher<AccessTokenDTO, Error> in
//                self.isRefreshingToken = false
//                self.refreshTokenSubject.send(completion: .failure(error))
                return Fail(error: error).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        }
}

class HTTPAuthenticationNetworkServiceMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> (data: Data, response: HTTPURLResponse) {
        switch response.statusCode {
          case 401:
            throw APIError.unauthorized
            case 200:
            let response = try JSONDecoder().decode(AccessTokenDTO.self , from: data)
        default:
            break
        }
        return (data, response)
    }
}

