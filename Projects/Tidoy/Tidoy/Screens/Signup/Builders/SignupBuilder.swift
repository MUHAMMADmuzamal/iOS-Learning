//
//  SignupBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import SwiftUI
import Swinject

final class SignupBuilder {
    static func build(injector: Container) -> some View {
        let router = SignupRouter(injector: injector)
        let useCase = injector.resolve(SignupUseCaseProtocol.self)!
        let logger = injector.resolve(ConsoleLogger.self)!
        let viewModel = SignupVM(router: router, useCase: useCase, logger: logger)
        return SignupView(viewModel: viewModel)
    }
}
