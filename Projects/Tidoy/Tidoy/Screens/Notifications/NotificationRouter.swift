//
//  NotificationRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import Foundation

protocol NotificationRouterProtocol {
    func navigateToMessages()
    func dissmiss()
}

final class NotificationRouter: Router, NotificationRouterProtocol {
    
    func navigateToMessages() {
//        coordinator.displaySheet(with: MessagesRoute(), onDismiss: {
//            print("Sheet was dismissed! Perform cleanup here.")
//        })
        coordinator.navigate(to: MessagesRoute())
    }
    
    func dissmiss() {
        coordinator.dissmissSheet()
    }
}
