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
    var displaySignup: Bool { get set }
    var sheetRoute: AnyRoute? { get }
    
    func navigate(to route: some Route)
    func displaySheet(with route: some Route, onDismiss: (()-> Void)?)
    func goBack()
    func dissmissSheet()
}

class AppCoordinator: AppCoordinatorProtocol, ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn: Bool = false
    @Published var displaySignup: Bool = false
    @Published var sheetRoute: AnyRoute?
    @Published var selectedTab: TabBarItems = .home
    
    private var sheetDismissHandler: (() -> Void)?
    
    func navigate(to route: some Route) {
        path.append(AnyRoute(route))
    }
    
    func displaySheet(with route: some Route, onDismiss: (() -> Void)? = nil) {
        sheetRoute = AnyRoute(route)
        sheetDismissHandler = onDismiss
    }
    
    func dissmissSheet() {
        self.sheetRoute = nil
        sheetDismissHandler?()
        sheetDismissHandler = nil
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
