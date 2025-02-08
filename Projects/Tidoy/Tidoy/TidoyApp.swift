//
//  TidoyApp.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI

@main
struct TidoyApp: App {
    @StateObject var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                SplashScreen()
                    .environmentObject(coordinator)
            }
        }
    }
}
