//
//  HomeAssebly.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Swinject

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeServiceProtocol.self) { resolver in
            let client = resolver.resolve(URLSession.self) ?? URLSession.shared
            return HomeService(repository: HomeRepository(client: client))
        }.inObjectScope(.container)
    }
}
