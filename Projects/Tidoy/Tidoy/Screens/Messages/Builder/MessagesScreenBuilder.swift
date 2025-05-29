//
//  MessageBuilder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 29/05/2025.
//

import SwiftUI
import Swinject

final class MessagesScreenBuilder {
    static func build(injector: Container) -> some View {
        let router = MessagesScreenRouter(injector: injector)
        let viewModel = MessagesVM(router: router)
        return MessagesView(viewModel: viewModel)
    }
}
