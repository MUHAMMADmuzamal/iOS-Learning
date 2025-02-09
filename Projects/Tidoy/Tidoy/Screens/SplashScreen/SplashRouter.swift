//
//  SplashRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

final class SplashRouter {
    func navigateOnboarding( coordinator: AppCoordinator) {
        coordinator.path.append(AnyRoute(OnboardingRoute()))
    }
}
