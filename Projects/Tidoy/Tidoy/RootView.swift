//
//  RootView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI
import Swinject

struct RootView: View {
    let injector: Container
    @StateObject var coordinator: AppCoordinator
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
                    OnboardingScreen(router: OnboardingRouter(injector: self.injector, coordinator: coordinator))
                } else if coordinator.displaySignup {
                    SignupView(router: SignupRouterRouter(injector: self.injector, coordinator: coordinator))
                } else {
                    if !coordinator.isLoggedIn {
                        LoginView(router: LoginRouter(injector: self.injector, coordinator: coordinator))
                   } else {
                       HomeView(router: HomeRouter(injector: self.injector, coordinator: coordinator))
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
    RootView(injector: DependenciesHolder().injector(), coordinator: AppCoordinator())
}
