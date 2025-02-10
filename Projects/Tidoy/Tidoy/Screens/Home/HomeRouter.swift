//
//  HomeRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import Foundation

protocol HomeRouterProtocol: RouterProtocol {
    func navigateToNotification()
}

final class HomeRouter: HomeRouterProtocol {
    var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToNotification() {
        coordinator.navigate(to: NotificationRoute(coordinator: coordinator))
    }
}
