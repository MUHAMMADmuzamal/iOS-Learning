//
//  NotificationVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/02/2025.
//

import Foundation

protocol NotificationVMProtocol {
    func navigateToMessages()
}

final class NotificationVM: NotificationVMProtocol {
    private var router: NotificationRouterProtocol!
    
    init(router: NotificationRouterProtocol) {
        self.router = router
    }
    
    func navigateToMessages() {
        self.router.navigateToMessages()
    }
    
}
