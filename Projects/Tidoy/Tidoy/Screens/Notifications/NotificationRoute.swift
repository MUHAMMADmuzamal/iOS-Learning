//
//  NotificationRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct NotificationRoute: Route {

    let router: NotificationRouterProtocol
    
    init(router: NotificationRouterProtocol) {
        self.router = router
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
