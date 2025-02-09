//
//  SignupRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

final class SignupRouter {
    func navigateSignIn(coordinator: AppCoordinator) {
        coordinator.path.append(AnyRoute(SignupRoute()))
    }
}
