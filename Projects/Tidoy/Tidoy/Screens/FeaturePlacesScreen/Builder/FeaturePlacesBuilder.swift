//
//  FeaturePlacesBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import SwiftUI
import Swinject

final class FeaturePlacesScreenBuilder {
    static func build(injector: Container) -> some View {
        
        let router = FeaturePlacesScreenRouter(injector: injector)
        let viewModel = FeaturePlacesScreenVM(router: router)
        return FeaturePlacesScreen(viewModel: viewModel)
    }
}
