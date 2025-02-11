//
//  OnboardingRoute.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

struct OnboardingRoute: Route {
    let router: OnboardingRouterProtocol
    
    init(router: OnboardingRouterProtocol) {
        self.router = router
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
