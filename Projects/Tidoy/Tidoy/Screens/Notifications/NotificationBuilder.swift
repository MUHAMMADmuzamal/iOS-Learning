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
        let router = NotificationRouter(injector: injector)
        let viewModel = NotificationVM(router: router)
        return NotificationView(viewModel: viewModel)
    }
}
