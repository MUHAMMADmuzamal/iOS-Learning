//
//  Coordinator.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn: Bool = false
    @Published var displaySignup: Bool = true
    @Published var hasCompletedOnboarding: Bool = false
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
