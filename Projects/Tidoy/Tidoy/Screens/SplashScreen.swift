//
//  SplashScreen.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var coordinator: AppCoordinator
    private var router = SplashRouter()
    
    var body: some View {
        ZStack {
            Image("splashScreenImg")
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea(.all)
        .navigationDestination(for: OnboardingRoute.self) { route in
            route.destinationView()
        }
        .navigationDestination(for: AnyRoute.self) { route in
            route.destinationView()
        }
        .onAppear {
            router.navigate(to: OnboardingRoute(), coordinator: coordinator)
        }
    }
}

#Preview {
    @StateObject var coordinator = AppCoordinator()
    return  NavigationStack(path: $coordinator.path) {
        SplashScreen()
            .environmentObject(coordinator)
    }
}
