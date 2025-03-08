//
//  AuthenticationNetworkService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 06/03/2025.
//

import Foundation
import Combine

class HTTPAuthenticationNetworkService: HTTPClient {
    let httpClient: HTTPClient
    private var isRefreshingToken: Bool = false
    private var refreshTokenSubject =  PassthroughSubject<RefreshTokenResponseDTO, Error>()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func performRequest(_ request: Endpoint) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        return httpClient.performRequest(request)
            .tryMap(HTTPAuthenticationNetworkServiceMapper.map)
            .tryCatch { error in
                if let _ = error as? UnAuthorizedError {
                     return try self.refreshToken()
                        .flatMap { _ in self.httpClient.performRequest(request) }
                        .eraseToAnyPublisher()
                } else {
                    throw error
                }
            }
            .eraseToAnyPublisher()

    }
    
    private func refreshToken() throws -> AnyPublisher<RefreshTokenResponseDTO, Error> {
        
        if isRefreshingToken {
            return refreshTokenSubject.eraseToAnyPublisher()
        }
        
        isRefreshingToken = true
        
        return  httpClient.performRequest(
            RefreshTokenEndpoint(queryParams:
                                    try RefreshTokenRequestDTO(
                                        refreshToken: TokenStorage.refreshToken ?? "").toQueryItems()
                                )
        )
        .tryMap(HTTPAuthenticationNetworkServiceMapper.refreshTokenMap)
        .handleEvents(receiveOutput: { response in
            TokenStorage.accessToken = response.accessToken
            self.refreshTokenSubject.send(response)
            self.refreshTokenSubject.send(completion: .finished)
        }, receiveCompletion: { _ in
            self.isRefreshingToken = false
        })
        .catch { error -> AnyPublisher<RefreshTokenResponseDTO, Error> in
            self.isRefreshingToken = false
            self.refreshTokenSubject.send(completion: .failure(error))
            self.handleRefreshTokenFailure(error)
            return Fail(error: error).eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
    private func handleRefreshTokenFailure(_ error: Error) {
        print("Refresh Token Failed: \(error.localizedDescription)")
        
        // Clear stored tokens
        TokenStorage.accessToken = nil
        TokenStorage.refreshToken = nil
        
        // Notify app to log out user
//        NotificationCenter.default.post(name: .logoutUser, object: nil)
    }
}
