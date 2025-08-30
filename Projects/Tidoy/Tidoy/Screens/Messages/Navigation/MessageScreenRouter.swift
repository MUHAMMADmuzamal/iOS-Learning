//
//  MessageScreenRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 29/05/2025.
//

import Foundation
protocol MessagesScreenRouterProtocol {
    func goBack()
}

final class MessagesScreenRouter: Router, MessagesScreenRouterProtocol {
    
    func goBack() {
        coordinator.goBack()
    }
}
