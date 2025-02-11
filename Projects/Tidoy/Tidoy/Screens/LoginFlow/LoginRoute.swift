//
//  LoginRoute.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

struct LoginRoute: Route {
    
    let router: LoginRouterProtocol
    
    init(router: LoginRouterProtocol) {
        self.router = router
    }
    func destinationView() -> some View {
        LoginView(router: router)
    }
}

extension LoginRoute {
    static func == (lhs: LoginRoute, rhs: LoginRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("LoginRoute")
    }
}
