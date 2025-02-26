//
//  CoreDIContainer.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
import Swinject

class CoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(URLSession.self) { _ in URLSession.shared }
            .inObjectScope(.container)
    }
}
