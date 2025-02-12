//
//  SignupRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

protocol SignupRouterProtocol {
    func navigateToSignIn()
}

final class SignupRouterRouter: Router, SignupRouterProtocol {
        
    func navigateToSignIn() {
        coordinator.displaySignup = false
    }
}
