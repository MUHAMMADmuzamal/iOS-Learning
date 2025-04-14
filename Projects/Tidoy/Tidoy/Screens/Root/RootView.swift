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
    @ObservedObject var viewModel: RootVM
    @ObservedObject var coordinator: AppCoordinator
    
    init(injector: Container) {
        let coordinator = injector.resolve(AppCoordinator.self)!
        
        self.injector = injector
        self.coordinator = coordinator
        self.viewModel = RootVM(coordinator: coordinator)
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
        } else if coordinator.displaySignup {
            signup
        } else {
            if !coordinator.isLoggedIn {
                login
            } else {
                TabBarContainerView(selection: $coordinator.selectedTab) {
                    home
                        .tabBarItems(tab: .home, selection: $coordinator.selectedTab)
                    TestTabView(text: "2")
                        .tabBarItems(tab: .wishList, selection: $coordinator.selectedTab)
                    TestTabView(text: "3")
                        .tabBarItems(tab: .stay, selection: $coordinator.selectedTab)
                    TestTabView(text: "4")
                        .tabBarItems(tab: .profile, selection: $coordinator.selectedTab)
                }
//                home
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
        SignupBuilder.build(injector: injector)
    }
    
    private var login: some View {
        LoginBuilder.build(injector: injector)
    }
    
    private var home: some View {
        HomeBuilder.build(injector: injector)
    }
}

#Preview {
    RootView(injector: DependenciesHolder.shared.injector())
}
