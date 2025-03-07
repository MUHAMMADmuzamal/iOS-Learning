//
//  LoginUseCase.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Combine

protocol LoginUseCaseProtocol {
    func login(email: String, password: String) -> AnyPublisher<LoginResponseDTO, AppError>
}

final class LoginUseCase: LoginUseCaseProtocol {
    let service: LoginServiceProtocol
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponseDTO, AppError>{
        return service.login(email: email, password: password)
    }
}
