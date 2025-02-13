//
//  Coordinator.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

protocol AppCoordinatorProtocol {
    var path: NavigationPath { get set }
    var isLoggedIn: Bool { get set }
    
    func navigate(to route: some Route)
    func goBack()
}

class AppCoordinator: AppCoordinatorProtocol, ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn: Bool = false
    
    func navigate(to route: some Route) {
        path.append(AnyRoute(route))
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
