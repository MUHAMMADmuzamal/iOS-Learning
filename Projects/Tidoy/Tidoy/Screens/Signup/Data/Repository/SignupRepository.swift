//
//  SignupRepository.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation
import Combine

protocol SignupRepositoryProtocol {
    func signup(_ model: SignupSendDTO) -> AnyPublisher<SignupResponseDTO, AppError>
}

final class SignupRepository: SignupRepositoryProtocol {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func signup(_ model: SignupSendDTO) -> AnyPublisher<SignupResponseDTO, AppError> {
        do {
             let endpoint = try SignupURLRequestFactory.makeSignupURLRequest(model)
             
             return client.performRequest(endpoint)
                 .tryMap(SignupMapper.map)
                 .mapError { error in
                     return  (error as? AppError) ?? UnknownError(title: "Unknown Error",
                                                                  message: error.localizedDescription)
                 }
                 .eraseToAnyPublisher()
         } catch {
             return Fail(error: InvalidRequestError(title: "Invalid Request", message: error.localizedDescription))
                 .eraseToAnyPublisher()
         }
    }
}
