//
//  ContentView.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI
import Swinject

struct ContentView: View, InjectorProtocol {
    internal var injector: Container
    
    @ObservedObject var appCoordinator: AppCoordinator
    @ObservedObject var homeCoordinator: HomeCoordinator
    @ObservedObject var walletCoordinator: WalletCoordinator
    @ObservedObject var statisticsCoordinator: StatisticsCoordinator
    @ObservedObject var profileCoordinator: ProfileCoordinator
    
    init(injector: Container) {
        self.injector = injector
        self.appCoordinator = injector.resolve(AppCoordinator.self)!
        self.homeCoordinator = injector.resolve(HomeCoordinator.self)!
        self.walletCoordinator = injector.resolve(WalletCoordinator.self)!
        self.statisticsCoordinator = injector.resolve(StatisticsCoordinator.self)!
        self.profileCoordinator = injector.resolve(ProfileCoordinator.self)!
    }
    


    var body: some View {
        TabView(selection: $appCoordinator.selectedTab) {
            
            Tab("Home", systemImage: "house.fill", value: .home) {
                NavigationStack(path: $homeCoordinator.path) {
                    HomeFactory.make(injector: injector)
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
    ContentView(injector: DependenciesHolder.shared.injector())
}
