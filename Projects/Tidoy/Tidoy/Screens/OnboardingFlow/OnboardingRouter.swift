//
//  OnboardingRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

protocol OnboardingRouterProtocol {
    func navigateToSignup()
}

final class OnboardingRouter: Router, OnboardingRouterProtocol {
    
    func navigateToSignup() {
        coordinator.hasCompletedOnboarding = true
    }
}
