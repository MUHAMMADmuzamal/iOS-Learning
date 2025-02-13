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
                } else if viewModel.displaySignup {
                    SignupView(displaySignup: $viewModel.displaySignup)
                } else {
                    if !viewModel.coordinator.isLoggedIn {
                        LoginView(displaySignup: $viewModel.displaySignup, isLoggedIn: $viewModel.coordinator.isLoggedIn)
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
