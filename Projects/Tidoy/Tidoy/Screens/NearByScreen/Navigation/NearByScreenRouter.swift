//
//  NearByScreenRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import Foundation
protocol NearByScreenRouterProtocol: RouterProtocol {
    func goBack()
}

final class NearByScreenRouter: Router, NearByScreenRouterProtocol {
    
    func goBack() {
        coordinator.goBack()
    }
}
