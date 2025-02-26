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
        container.register(AppCoordinator.self) { _ in
            AppCoordinator()
        }.inObjectScope(.container)
        
        container.register(HomeServiceProtocol.self) { _ in
            HomeService(repository: HomeRepository(client: URLSession.shared))
        }.inObjectScope(.container)
        return container
    }
}
