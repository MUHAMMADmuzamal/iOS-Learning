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
    var sheetRoute: AnyRoute? { get }
    
    func navigate(to route: some Route)
    func displaySheet(with route: some Route)
    func goBack()
    func dissmissSheet()
}

class AppCoordinator: AppCoordinatorProtocol, ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn: Bool = true
    @Published var sheetRoute: AnyRoute?
    
    func navigate(to route: some Route) {
        path.append(AnyRoute(route))
    }
    
    func displaySheet(with route: some Route) {
        sheetRoute = AnyRoute(route)
    }
    
    func dissmissSheet() {
        self.sheetRoute = nil
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
