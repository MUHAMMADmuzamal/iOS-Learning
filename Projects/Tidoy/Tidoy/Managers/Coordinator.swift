//
//  Coordinator.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}
