//
//  SignupRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation

protocol SignupRouterProtocol: RouterProtocol {
    func navigateToLogin()
}

final class SignupRouter: Router, SignupRouterProtocol {
    func navigateToLogin() {
        coordinator.displaySignup = false
    }
}
