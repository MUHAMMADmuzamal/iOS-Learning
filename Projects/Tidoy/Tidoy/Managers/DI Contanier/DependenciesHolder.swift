//
//  DependenceHolder.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 12/02/2025.
//

import Swinject

class DependenciesHolder {
    static let shared = DependenciesHolder()
    
    private let container: Container
    
    private init() {
        container = Container()
        createAssemblies()
    }
    
    private func createAssemblies() {
         _ = Assembler(
            [
                CoreAssembly(),
                AppAssembly(),
                HomeAssembly(),
                LoggerDIContainer()
            ],
        container: container)
    }
    
    func injector() -> Container {
        return container
    }
}
