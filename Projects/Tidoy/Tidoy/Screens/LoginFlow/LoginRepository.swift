//
//  LoginRepository.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Combine

protocol LoginRepositoryProtocol {
    func login(email: String, password: String) -> AnyPublisher<LoginResponseDTO, AppError>
}

final class LoginRepository: LoginRepositoryProtocol {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponseDTO, AppError> {
        let data = try? LoginSendDTO(email: email, password: password).encode()
        return client.performRequest(LoginURLRequestFactory.makeLoginURLRequest(data))
            .tryMap(LoginMapper.map)
            .mapError { error in
                if let apiError = error as? APIError {
                    return AppError.api(apiError)
                } else {
                    return .network
                }
            }
            .eraseToAnyPublisher()
    }
}
