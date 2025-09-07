//
//  ContentView.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appCoordinator = AppCoordinator()
    
    var body: some View {
        
        TabView(selection: $appCoordinator.selectedTab) {
            
            Tab("Home", systemImage: "house.fill", value: .home) {
                NavigationStack(path: $appCoordinator.homeCoordinator.path) {
                    HomeFactory.make(coordinator: appCoordinator)
                        .navigationDestination(for: HomeRoute.self, destination: HomeRouter.view)
                        .sheet(item: $appCoordinator.homeCoordinator.sheet, onDismiss: $appCoordinator.homeCoordinator.wrappedValue.sheetDismissHandler, content: HomeRouter.sheet)
                        .fullScreenCover(item: $appCoordinator.homeCoordinator.fullScreenCover, onDismiss: $appCoordinator.homeCoordinator.wrappedValue.fullScreenDismissHandler, content: HomeRouter.fullScreenCover)
                }
            }
            
            Tab("Statistics", systemImage: "chart.bar.xaxis.ascending", value: .statistics) {
                NavigationStack(path: $appCoordinator.homeCoordinator.path) {
                    StatisticsFactory.make()
                }
            }
            
            Tab("Wallet", systemImage: "wallet.bifold", value: .wallet) {
                NavigationStack(path: $appCoordinator.homeCoordinator.path) {
                    WalletFactory.make()
                }
            }
            
            Tab("Profile", systemImage: "person.fill", value: .profile) {
                NavigationStack(path: $appCoordinator.homeCoordinator.path) {
                    WalletFactory.make()
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
