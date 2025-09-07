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
    @StateObject var walletCoordinator = WalletCoordinator()
    @StateObject var statisticsCoordinator = StatisticsCoordinator()
    @StateObject var profileCoordinator = ProfileCoordinator()

    var body: some View {
        TabView(selection: $appCoordinator.selectedTab) {
            
            Tab("Home", systemImage: "house.fill", value: .home) {
                NavigationStack(path: $homeCoordinator.path) {
                    HomeFactory.make(coordinator: homeCoordinator,
                                     appCoordinator: appCoordinator)
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
            
            Tab("Statistics", systemImage: "chart.bar", value: .statistics) {
                NavigationStack(path: $statisticsCoordinator.path) {
                    StatisticsFactory.make()
                }
            }
            
            Tab("Wallet", systemImage: "wallet.bifold", value: .wallet) {
                NavigationStack(path: $walletCoordinator.path) {
                    WalletFactory.make()
                }
            }
            
            Tab("Profile", systemImage: "person.fill", value: .profile) {
                NavigationStack(path: $profileCoordinator.path) {
                    ProfileFactory.make()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
