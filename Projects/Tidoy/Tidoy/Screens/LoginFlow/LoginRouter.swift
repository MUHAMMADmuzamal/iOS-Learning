//
//  LoginRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

protocol LoginRouterProtocol {
    func navigateToSignUp()
    func navigateToHome()
}

final class LoginRouter: Router, LoginRouterProtocol {
    
    func navigateToSignUp() {
//        coordinator.displaySignup = true
    } 
    
    func navigateToHome() {
        coordinator.isLoggedIn = true
    }
}
