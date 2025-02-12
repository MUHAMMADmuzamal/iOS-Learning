//
//  NotificationRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import Foundation

protocol NotificationRouterProtocol {
    func navigateToMessages()
}

final class NotificationRouter: Router, NotificationRouterProtocol {
    
    func navigateToMessages() {
        coordinator.navigate(to: MessagesRoute())
    }
}
