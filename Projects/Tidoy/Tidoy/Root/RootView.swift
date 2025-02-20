//
//  RootView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI
import Swinject

struct RootView: View {
    private let injector: Container
    @ObservedObject var viewModel = RootVM()
    @ObservedObject var coordinator: AppCoordinator
    
    init(injector: Container) {
        self.injector = injector
        self.coordinator = injector.resolve(AppCoordinator.self)!
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            if viewModel.isLoading {
                splash
            } else {
                contentView
            }
        }
        .sheet(item: $coordinator.sheetRoute, onDismiss: coordinator.dissmissSheet) { route in
            route.destinationView()
                .clipShape(CustomRoundedRectangle(cornerRadius: 32, corners: [.topLeft, .topRight]))
                .ignoresSafeArea()
                .presentationBackground(.clear)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        if !viewModel.hasCompletedOnboarding {
            onboarding
        } else if viewModel.displaySignup {
            signup
        } else {
            if !coordinator.isLoggedIn {
                login
            } else {
                home
                    .navigationDestination(for: AnyRoute.self) { route in
                        route.destinationView()
                    }
            }
        }
    }
    
    private var splash: some View {
        SplashScreen {
            withAnimation {
                viewModel.finishLoading()
            }
        }
    }
    
    private var onboarding: some View {
        OnboardingScreen(hasCompletedOnboarding: $viewModel.hasCompletedOnboarding)
    }
    
    private var signup: some View {
        SignupView(displaySignup: $viewModel.displaySignup)
    }
    
    private var login: some View {
        LoginView(displaySignup: $viewModel.displaySignup, isLoggedIn: $coordinator.isLoggedIn)
    }
    
    private var home: some View {
        HomeView(router: HomeRouter(injector: self.injector))
    }
}

#Preview {
    RootView(injector: DependenciesHolder().injector())
}
