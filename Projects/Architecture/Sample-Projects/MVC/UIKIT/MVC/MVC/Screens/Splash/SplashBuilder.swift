//
//  SplashBuilder.swift
//  MVC
//
//  Created by Codes Orbit on 15/05/2024.
//

import Foundation
import Swinject

class SplashBuilder {
    static func build(injector: Container) -> SplashView {
        let vc = SplashView.instantiateView(name: .splash)
        
        let router =  SplashRouter(injector: injector)
        
        let viewModel = SplashViewModel(router: router)
        
        vc.viewModel = viewModel
        
        return vc
    }
}
