//
//  SignupRoute.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

struct SignupRoute: Route {
    
    let router: SignupRouterProtocol
    
    init(router: SignupRouterProtocol) {
        self.router = router
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
