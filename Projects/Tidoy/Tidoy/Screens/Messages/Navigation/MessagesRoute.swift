//
//  MessagesRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI
import Swinject

struct MessagesRoute: Route {
    let injector: Container
    
    func destinationView() -> some View {
        return MessagesScreenBuilder.build(injector: self.injector)
    }
}
