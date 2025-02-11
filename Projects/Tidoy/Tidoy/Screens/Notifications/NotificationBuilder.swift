//
//  NotificationBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 11/02/2025.
//

import Foundation

final class NotificationBuilder {
    static func build(coordinator: AppCoordinator) -> NotificationRoute {
        let router = NotificationRouter(coordinator: coordinator)
        let route = NotificationRoute(router: router)
        return route
    }
}
