//
//  NotificationRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import Foundation

protocol NotificationRouterProtocol: RouterProtocol {
    func navigateToMessages()
}

final class NotificationRouter: NotificationRouterProtocol {
    var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToMessages() {
        coordinator.navigate(to: MessagesRoute())
    }
}
