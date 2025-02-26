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
        let service = injector.resolve(HomeServiceProtocol.self)!
        let viewModel = HomeVM(router: router, service: service)
        return HomeView(viewModel: viewModel)
    }
}
