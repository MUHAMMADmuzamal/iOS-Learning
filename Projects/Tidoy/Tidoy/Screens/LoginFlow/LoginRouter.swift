//
//  LoginRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Swinject

protocol LoginRouterProtocol: RouterProtocol {
    func navigateToHome()
}

final class LoginRouter: Router, LoginRouterProtocol {
    
    func navigateToHome() {
        coordinator.isLoggedIn = true
    }
}
