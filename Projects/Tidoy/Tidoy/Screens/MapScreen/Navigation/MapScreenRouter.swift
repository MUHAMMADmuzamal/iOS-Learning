//
//  MapScreenRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/04/2025.
//

import Foundation

protocol MapScreenRouterProtocol {
    func goBack()
}

final class MapScreenRouter: Router, MapScreenRouterProtocol {
    
    func goBack() {
        coordinator.goBack()
    }
}
