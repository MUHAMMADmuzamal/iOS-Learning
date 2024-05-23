//
//  DependenciesHolder.swift
//  MVC
//
//  Created by Codes Orbit on 21/05/2024.
//

import Swinject
class DependenciesHolder {
    
    func injector() -> Container {
        let container = Container()
        
//        container.register(NotificationsService.self) { _ -> NotificationsService in
//            return NotificationsService(injector: container, center: UNUserNotificationCenter.current())
//        }.inObjectScope(.container)
        
        container.register(NetworkMonitoringService.self) { _ -> NetworkMonitoringService in
            return NetworkMonitoringService()
        }.inObjectScope(.container)
        
//        container.register(CommunityNetworkProvider.self) { resolver -> CommunityNetworkProvider in
//            return CommunityNetworkProvider(networkMonitoringService: resolver.resolve(NetworkMonitoringService.self)!)
//        }.inObjectScope(.transient)
        return container
    }
}
