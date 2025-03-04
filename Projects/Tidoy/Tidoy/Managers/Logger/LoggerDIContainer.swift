//
//  LoggerDIContainer.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation
import Swinject

final class LoggerDIContainer: Assembly {
    func assemble(container: Container) {
        container.register(ConsoleLogger.self) { _ in
            ConsoleLogger()
        }.inObjectScope(.container)
        
        container.register(LoggerEndPoint.self) { _ in
            LoggerEndPoint()
        }.inObjectScope(.transient)
        
        container.register(RemoteLogger.self) { resolver in
            let httpClient = resolver.resolve(NetworkService.self)!
            let consoleLogger = resolver.resolve(ConsoleLogger.self)!
            let loggerEndPoint = resolver.resolve(LoggerEndPoint.self)!
            return RemoteLogger(wrapper: consoleLogger,
                                httpClient: httpClient,
                                logEndpoint: loggerEndPoint)
        }.inObjectScope(.container)
    }
}
