//
//  FeaturePlacesRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import Foundation

protocol FeaturePlacesScreenRouterProtocol: RouterProtocol {
    func goBack()
}

final class FeaturePlacesScreenRouter: Router, FeaturePlacesScreenRouterProtocol {
    
    func goBack() {
        coordinator.goBack()
    }
}
