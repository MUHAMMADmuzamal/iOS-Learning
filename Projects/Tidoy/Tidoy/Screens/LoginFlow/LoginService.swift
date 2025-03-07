//
//  LoginService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Combine

protocol LoginServiceProtocol {
    func login(email: String, password: String) -> AnyPublisher<LoginResponseDTO, AppError>
}

final class LoginService: LoginServiceProtocol {
    
    let repository: LoginRepositoryProtocol
    
    init(repository: LoginRepositoryProtocol) {
        self.repository = repository
    }
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponseDTO, AppError>{
        return repository.login(email: email, password: password)
    }
}
