//
//  OnboardingRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

final class OnboardingRouter {
    func navigateSignup(coordinator: AppCoordinator) {
        coordinator.path.append(AnyRoute(SignupRoute()))
    }
}
