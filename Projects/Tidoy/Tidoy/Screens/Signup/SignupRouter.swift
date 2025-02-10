//
//  SignupRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

protocol SignupRouterProtocol: RouterProtocol {
    func navigateToSignIn()
}

final class SignupRouterRouter: SignupRouterProtocol {
    var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToSignIn() {
        coordinator.displaySignup = false
    }
}
