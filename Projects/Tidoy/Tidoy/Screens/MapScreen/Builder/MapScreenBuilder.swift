//
//  MapScreenBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/04/2025.
//

import SwiftUI
import Swinject

final class MapScreenBuilder {
    static func build(injector: Container) -> some View {
        let router = MapScreenRouter(injector: injector)
        let viewModel = MapScreenVM(router: router)
        return MapScreen(viewModel: viewModel)
    }
}
