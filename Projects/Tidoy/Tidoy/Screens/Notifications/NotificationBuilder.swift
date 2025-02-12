//
//  NotificationBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 11/02/2025.
//

import SwiftUI
import Swinject

final class NotificationBuilder {
    static func build(injector: Container) -> some View {
        let coordinator = injector.resolve(AppCoordinatorProtocol.self)!
        let router = NotificationRouter(injector: injector, coordinator: coordinator)
        return NotificationView(router: router)
    }
}
