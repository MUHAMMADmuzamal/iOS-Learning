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
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Image("splashScreenImg")
                    .resizable()
                    .scaledToFill()
            }
            .ignoresSafeArea(.all)
            .navigationDestination(for: AnyRoute.self) { route in
                route.destinationView()
            }
            .onAppear {
                router.navigateOnboarding(coordinator: coordinator)
            }
        }
    }
}

#Preview {
    @StateObject var coordinator = AppCoordinator()
    return  NavigationStack(path: $coordinator.path) {
        SplashScreen()
    }
    .environmentObject(coordinator)
}
