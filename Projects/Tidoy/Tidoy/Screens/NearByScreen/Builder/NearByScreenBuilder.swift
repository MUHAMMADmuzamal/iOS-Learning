//
//  NearByScreenBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import SwiftUI
import Swinject

final class NearByScreenBuilder {
    static func build(injector: Container) -> some View {
        let router = NearByScreenRouter(injector: injector)
        let viewModel = NearByScreenVM(router: router)
        return NearByScreen(viewModel: viewModel)
    }
}
