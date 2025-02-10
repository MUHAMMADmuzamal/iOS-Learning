//
//  OnboardingRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

protocol OnboardingRouterProtocol: RouterProtocol {
    func navigateToSignup()
}

final class OnboardingRouter: OnboardingRouterProtocol {
    var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToSignup() {
        coordinator.hasCompletedOnboarding = true
    }
}
