//
//  RootView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator = AppCoordinator()
    @State private var isLoading = true

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            if isLoading {
                SplashScreen {
                    withAnimation {
                        isLoading = false
                    }
                }
            } else {
                if !coordinator.hasCompletedOnboarding {
                    OnboardingScreen(router: OnboardingRouter(coordinator: coordinator))
                } else if coordinator.displaySignup {
                    SignupView(router: SignupRouterRouter(coordinator: coordinator))
                } else {
                    if !coordinator.isLoggedIn {
                        LoginView(router: LoginRouter(coordinator: coordinator))
                   } else {
                       HomeView(router: HomeRouter(coordinator: coordinator))
                           .navigationDestination(for: AnyRoute.self) { route in
                               route.destinationView()
                           }
                   }
                }
            }
        }
    }
}

#Preview {
    RootView()
}
