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
        
        container.register(HttpRemoteLogSender.self) { resolver in
            let httpClient = resolver.resolve(NetworkService.self)!
            return HttpRemoteLogSender(httpClient: httpClient)
        }
        
        container.register(RemoteLogger.self) { resolver in
            let consoleLogger = resolver.resolve(ConsoleLogger.self)!
            let logSender = resolver.resolve(HttpRemoteLogSender.self)!
            return RemoteLogger(wrapper: consoleLogger, logSender: logSender)
        }.inObjectScope(.container)
    }
}
