//
//  LognDIContainer.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Swinject

final class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginUseCaseProtocol.self) { resolver in
            let client = resolver.resolve(HTTPAuthenticationNetworkService.self)!
            let repository = LoginRepository(client: client)
            return LoginUseCase(repository: repository)
        }.inObjectScope(.weak)
    }
}
