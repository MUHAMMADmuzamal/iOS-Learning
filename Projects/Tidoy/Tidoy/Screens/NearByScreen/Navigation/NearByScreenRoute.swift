//
//  NearByScreenRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import SwiftUI
import Swinject

struct NearByScreenRoute: Route {
    let injector: Container
    
    func destinationView() -> some View {
        return MapScreenBuilder.build(injector: self.injector)
    }
}
