//
//  HomeRouter.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import Foundation

protocol HomeRouterProtocol: RouterProtocol {
    func navigateToNotification()
    func navigateToMapScreen()
    func navigateToNearByScreen()
    func navigateToFeaturePlacesScreen()
}

final class HomeRouter: Router, HomeRouterProtocol {
    
    func navigateToNotification() {
        coordinator.navigate(to: NotificationRoute(injector: self.injector))
    }
    
    func navigateToMapScreen() {
        coordinator.navigate(to: MapScreenRoute(injector: self.injector))
    }
    
    func navigateToNearByScreen() {
        coordinator.navigate(to: NearByScreenRoute(injector: self.injector))
    }
    
    func navigateToFeaturePlacesScreen() {
        coordinator.navigate(to: FeaturePlacesScreenRoute(injector: self.injector))
    }
}
