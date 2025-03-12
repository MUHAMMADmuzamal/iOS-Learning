//
//  HomeAssebly.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Swinject

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeUseCaseProtocol.self) { resolver in
            let client = resolver.resolve(HTTPAuthenticationNetworkService.self)!
//            let repository = HomeRepository(client: client)
            let repository = HomeCoreDataRepository()
            return HomeUseCase(repository: repository)
        }.inObjectScope(.weak)
    }
}
