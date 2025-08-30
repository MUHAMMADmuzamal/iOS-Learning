//
//  NotificationRoute.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI
import Swinject

struct NotificationRoute: Route {
    let injector: Container
    
    func destinationView() -> some View {
        return NotificationBuilder.build(injector: self.injector)
    }
}
