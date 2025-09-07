//
//  ContentView.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appCoordinator = AppCoordinator()
    @StateObject var homeCoordinator = HomeCoordinator()
    
    var body: some View {
        
        TabView(selection: $appCoordinator.selectedTab) {
            
            Tab("Home", systemImage: "house.fill", value: .home) {
                NavigationStack(path: $homeCoordinator.path) {
                    HomeFactory.make(coordinator: homeCoordinator)
                        .navigationDestination(for: HomeRoute.self,
                                               destination: HomeRouter.view)
                        .sheet(item: $homeCoordinator.sheet,
                               onDismiss: homeCoordinator.sheetDismissHandler,
                               content: HomeRouter.sheet)
                    
                        .fullScreenCover(item: $homeCoordinator.fullScreenCover,
                                         onDismiss: homeCoordinator.fullScreenDismissHandler,
                                         content: HomeRouter.fullScreenCover)
                }
            }
            
            Tab("Statistics", systemImage: "chart.bar.xaxis.ascending", value: .statistics) {
                NavigationStack(path: $appCoordinator.statisticsCoordinator.path) {
                    StatisticsFactory.make()
                }
            }
            
            Tab("Wallet", systemImage: "wallet.bifold", value: .wallet) {
                NavigationStack(path: $appCoordinator.walletCoordinator.path) {
                    WalletFactory.make()
                }
            }
            
            Tab("Profile", systemImage: "person.fill", value: .profile) {
                NavigationStack(path: $appCoordinator.profileCoordinator.path) {
                    WalletFactory.make()
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
