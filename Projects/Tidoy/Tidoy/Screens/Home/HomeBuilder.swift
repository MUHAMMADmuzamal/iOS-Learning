//
//  HomeRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import SwiftUI
import Swinject

final class HomeBuilder {
    static func build(injector: Container) -> some View {
        let router = HomeRouter(injector: injector)
        let useCase = injector.resolve(HomeUseCaseProtocol.self)!
        let viewModel = HomeVM(router: router, useCase: useCase)
        return HomeView(viewModel: viewModel)
    }
}
