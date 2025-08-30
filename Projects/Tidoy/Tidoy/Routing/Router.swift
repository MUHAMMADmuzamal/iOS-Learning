//
//  Router.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import Foundation
import Swinject

protocol RouterProtocol: InjectorProtocol {
    var coordinator: AppCoordinatorProtocol { get set }
}

class Router: RouterProtocol {
    var injector: Container
    var coordinator: AppCoordinatorProtocol
    
    init(injector: Container) {
        self.injector = injector
        self.coordinator = injector.resolve(AppCoordinator.self)!
    }
}
