//
//  SplashViewModel.swift
//  MVC
//
//  Created by Codes Orbit on 24/05/2024.
//

import Foundation
protocol SplashViewModelType {
    func navigateToRoot()
}

class SplashViewModel: SplashViewModelType {
    
    private var router: SplashNavigation
    
    init(router: SplashNavigation) {
        self.router = router
    }
    
    func navigateToRoot() {
        self.router.navigateToRoot()
    }
}
