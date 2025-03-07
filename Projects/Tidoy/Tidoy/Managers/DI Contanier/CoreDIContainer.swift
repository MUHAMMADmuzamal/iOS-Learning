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
        
        container.register(NetworkMonitoringService.self) { _ in NetworkMonitoringService() }
            .inObjectScope(.container)
        
        container.register(NetworkService.self) { resolver in
            NetworkService(networkMonitoringService: resolver.resolve(NetworkMonitoringService.self)!)
        }.inObjectScope(.transient)
        
        container.register(HTTPAuthenticationNetworkService.self) { resolver in
            HTTPAuthenticationNetworkService(httpClient: resolver.resolve(NetworkService.self)!)
        }.inObjectScope(.transient)
    }
}
