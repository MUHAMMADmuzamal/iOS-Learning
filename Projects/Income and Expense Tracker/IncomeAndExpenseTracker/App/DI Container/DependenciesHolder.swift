//
//  DIContainer.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import Foundation
import Swinject

protocol InjectorProtocol {
    var injector: Container { get set }
}

final class DependenciesHolder {
    static let shared = DependenciesHolder()
    
    private var container = Container()
    
    private init() {
        createAssemblies()
    }
    
    private func createAssemblies() {
        let  _ = Assembler([
        CoordinatorAssembly()
        ], container: container)
    }
    
    func injector() -> Container {
        return container
    }
}

class CoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppCoordinator.self) { _ in
            AppCoordinator()
        }.inObjectScope(.container)
        
        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator()
        }.inObjectScope(.container)
        
        container.register(WalletCoordinator.self) { _ in
            WalletCoordinator()
        }.inObjectScope(.container)
        
        container.register(StatisticsCoordinator.self) { _ in
            StatisticsCoordinator()
        }.inObjectScope(.container)
        
        container.register(ProfileCoordinator.self) { _ in
            ProfileCoordinator()
        }.inObjectScope(.container)
    }
}
