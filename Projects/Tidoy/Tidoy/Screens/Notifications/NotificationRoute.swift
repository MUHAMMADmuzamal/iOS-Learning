//
//  NotificationRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct NotificationRoute: Route {
    
    let coordinator: AppCoordinator
    let router: NotificationRouterProtocol
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.router = NotificationRouter(coordinator: coordinator)
    }
    
    func destinationView() -> some View {
        return NotificationView(router: router)
    }
}

extension NotificationRoute {
    static func == (lhs: NotificationRoute, rhs: NotificationRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("NotificationRoute")
    }
}
