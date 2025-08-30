//
//  FeaturePlacesRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import SwiftUI
import Swinject

struct FeaturePlacesScreenRoute: Route {
    let injector: Container
    
    func destinationView() -> some View {
        return FeaturePlacesScreenBuilder.build(injector: self.injector)
    }
}
