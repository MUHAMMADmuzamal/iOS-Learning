//
//  Router.swift
//  MVC
//
//  Created by Codes Orbit on 24/05/2024.
//

import Foundation
typealias SplashRouterRoutes = RootRoute
protocol SplashNavigation: SplashRouterRoutes {
    func navigateToRoot()
}
class SplashRouter: Router<SplashView>, SplashNavigation {

    var rootTransition: Transition {
        RootTransition()
    }
    
    func navigateToRoot() {
        self.displayRoot()
    }
}
