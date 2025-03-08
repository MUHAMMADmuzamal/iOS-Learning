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

struct RefreshTokenRequestDTO: Encodable {
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
    }
}

struct RefreshTokenResponseDTO: Decodable {
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

class HTTPAuthenticationNetworkService: HTTPClient {
    let httpClient: HTTPClient
    private var isRefreshingToken: Bool = false
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func performRequest(_ request: Endpoint) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        return httpClient.performRequest(request)
            .tryMap(HTTPAuthenticationNetworkServiceMapper.map)
            .tryCatch { error in
                if let apiError = error as? APIError, case .unAuthorized = apiError {
                     try self.refreshToken()
                        .flatMap { _ in self.httpClient.performRequest(request) }
                        .eraseToAnyPublisher()
                } else {
                    throw error
                }
            }
            .eraseToAnyPublisher()

    }
    
    private func refreshToken() throws -> AnyPublisher<RefreshTokenResponseDTO, Error> {
//            guard !isRefreshingToken else {
//                return refreshTokenSubject.eraseToAnyPublisher()
//            }
//
            isRefreshingToken = true

            return  httpClient.performRequest(
                RefreshTokenEndpoint(queryParams:
                                        try RefreshTokenRequestDTO(refreshToken: TokenStorage.refreshToken ?? "").toQueryItems())
            )
            .tryMap { data, _ -> RefreshTokenResponseDTO in
                let response = try JSONDecoder().decode(RefreshTokenResponseDTO.self, from: data)
                self.isRefreshingToken = false
                TokenStorage.accessToken = response.accessToken
//                self.refreshTokenSubject.send(response.accessToken)
//                self.refreshTokenSubject.send(completion: .finished)
                return response
            }
            .catch { error -> AnyPublisher<RefreshTokenResponseDTO, Error> in
                self.isRefreshingToken = false
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
            throw APIError.unAuthorized
        default:
            break
        }
        return (data, response)
    }
}

