//
//  OnboardingRoute.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

struct OnboardingRoute: Route {
    let coordinator: AppCoordinator
    let router: OnboardingRouterProtocol
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.router = OnboardingRouter(coordinator: coordinator)
    }
    
    func destinationView() -> some View {
        OnboardingScreen(router: router)
    }
}

extension OnboardingRoute {
    static func == (lhs: OnboardingRoute, rhs: OnboardingRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("OnboardingRoute")
    }
}
