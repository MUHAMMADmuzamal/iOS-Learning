//
//  LoginRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

protocol LoginRouterProtocol: RouterProtocol {
    func navigateToSignUp()
    func navigateToHome()
}

final class LoginRouter: LoginRouterProtocol {
    var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToSignUp() {
        coordinator.displaySignup = true
    } 
    
    func navigateToHome() {
        coordinator.isLoggedIn = true
    }
}
