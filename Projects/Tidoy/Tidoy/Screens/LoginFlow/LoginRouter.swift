//
//  LoginRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

final class LoginRouter {
    func navigateToSignUp( coordinator: AppCoordinator) {
        coordinator.path.append(AnyRoute(SignupRoute()))
    }
}
