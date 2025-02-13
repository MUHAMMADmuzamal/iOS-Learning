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
    @ObservedObject var viewModel = RootVM()
    @ObservedObject var coordinator: AppCoordinator

    init(injector: Container) {
        self.injector = injector
        self.coordinator = injector.resolve(AppCoordinator.self)!
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            if viewModel.isLoading {
                SplashScreen {
                    withAnimation {
                        viewModel.isLoading = false
                    }
                }
            } else {
                if !viewModel.hasCompletedOnboarding {
                    OnboardingScreen(hasCompletedOnboarding: $viewModel.hasCompletedOnboarding)
                } else if viewModel.displaySignup {
                    SignupView(displaySignup: $viewModel.displaySignup)
                } else {
                    if !coordinator.isLoggedIn {
                        LoginView(displaySignup: $viewModel.displaySignup, isLoggedIn: $coordinator.isLoggedIn)
                   } else {
                       HomeView(router: HomeRouter(injector: self.injector))
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
    RootView(injector: DependenciesHolder().injector())
}
