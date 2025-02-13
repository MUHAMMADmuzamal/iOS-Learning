//
//  RootView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI
import Swinject

struct RootView: View {
    @ObservedObject var viewModel: RootVM
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            if viewModel.isLoading {
                SplashScreen {
                    withAnimation {
                        viewModel.isLoading = false
                    }
                }
            } else {
                if !viewModel.hasCompletedOnboarding {
                    OnboardingScreen(hasCompletedOnboarding: $viewModel.hasCompletedOnboarding)
                } else if viewModel.coordinator.displaySignup {
                    SignupView(router: SignupRouterRouter(injector: viewModel.injector))
                } else {
                    if !viewModel.coordinator.isLoggedIn {
                        LoginView(router: LoginRouter(injector: viewModel.injector))
                   } else {
                       HomeView(router: HomeRouter(injector: viewModel.injector))
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
    RootView(viewModel: RootVM(injector: DependenciesHolder().injector()))
}
