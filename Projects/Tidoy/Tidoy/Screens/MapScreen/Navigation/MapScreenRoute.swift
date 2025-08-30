//
//  MapScreenRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/04/2025.
//

import SwiftUI
import Swinject

struct MapScreenRoute: Route {
    let injector: Container
    
    func destinationView() -> some View {
        return MapScreenBuilder.build(injector: self.injector)
    }
}
