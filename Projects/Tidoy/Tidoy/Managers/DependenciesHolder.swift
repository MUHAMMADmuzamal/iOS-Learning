//
//  DependenceHolder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 12/02/2025.
//

import Swinject

class DependenciesHolder {
    func injector() -> Container {
        let container = Container()
        container.register(AppCoordinator.self) { resolver in
            AppCoordinator()
        }.inObjectScope(.container)
        return container
    }
}
