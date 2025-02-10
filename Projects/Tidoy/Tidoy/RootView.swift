//
//  RootView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var isLoading = true

    var body: some View {
        if isLoading {
            SplashScreen {
                withAnimation {
                    isLoading = false
                }
            }
        } else {
            if !coordinator.hasCompletedOnboarding {
                OnboardingScreen()
            } else if coordinator.displaySignup {
                SignupView()
            } else {
                if !coordinator.isLoggedIn {
                   LoginView()
               } else {
                   HomeView()
               }
            }
        }
    }
}

#Preview {
    RootView()
}
