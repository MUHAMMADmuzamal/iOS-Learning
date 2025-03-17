//
//  DependencyInjection.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation
import Swinject

final class SignupAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SignupUseCaseProtocol.self) { resolver in
            let client = resolver.resolve(HTTPAuthenticationNetworkService.self)!
            let repository = SignupRepository(client: client)
            return SignupUseCase(repository: repository)
        }.inObjectScope(.weak)
    }
}
