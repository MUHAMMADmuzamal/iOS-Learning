//
//  SignupRoute.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

struct SignupRoute: Route {
    
    let coordinator: AppCoordinator
    let router: SignupRouterProtocol
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.router = SignupRouterRouter(coordinator: coordinator)
    }
    
    func destinationView() -> some View {
        return SignupView(router: router)
    }
}

extension SignupRoute {
    static func == (lhs: SignupRoute, rhs: SignupRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("SignupRoute")
    }
}
