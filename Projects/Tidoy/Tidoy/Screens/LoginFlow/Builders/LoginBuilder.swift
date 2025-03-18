//
//  LoginBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import SwiftUI
import Swinject

final class LoginBuilder {
    static func build(injector: Container) -> some View {
        let router = LoginRouter(injector: injector)
        let useCase = injector.resolve(LoginUseCaseProtocol.self)!
        let logger = injector.resolve(ConsoleLogger.self)!
        let viewModel = LoginVM(useCase: useCase, router: router, logger: logger)
        return LoginView(viewModel: viewModel)
    }

}
