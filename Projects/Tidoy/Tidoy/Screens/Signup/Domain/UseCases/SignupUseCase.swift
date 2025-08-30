//
//  SignupUseCase.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation
import Combine

protocol SignupUseCaseProtocol {
    func signup(_ model: SignupSendDTO) -> AnyPublisher<SignupResponseDTO, AppError>
}

final class SignupUseCase: SignupUseCaseProtocol {
    let repository: SignupRepositoryProtocol
    
    init(repository: SignupRepositoryProtocol) {
        self.repository = repository
    }
    
    func signup(_ model: SignupSendDTO) -> AnyPublisher<SignupResponseDTO, AppError> {
        return repository.signup(model)
    }
}
