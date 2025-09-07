//
//  AppCoordinator.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import Foundation

enum Tabs {
    case home, statistics, wallet, profile
}

class AppCoordinator: ObservableObject {
 
    
    @Published var selectedTab: Tabs = .home
    @Published var homeCoordinator = HomeCoordinator()
    @Published var statisticsCoordinator = StatisticsCoordinator()
    @Published var walletCoordinator = WalletCoordinator()
    @Published var profileCoordinator = ProfileCoordinator()
    
    func selectTab(_ tab: Tabs) {
        self.selectedTab = tab
    }
    
    //MARK: Home
    func pushOnHomeTab(_ page: [HomeRoute]) {
        self.selectTab(.home)
        homeCoordinator.push(page)
    }
    
    func presentOnHomeTab(sheet: HomeRoute) {
        self.selectTab(.home)
        homeCoordinator.present(sheet: sheet)
    }
    
    func presentOnHomeTab(fullscreenCover: HomeRoute) {
        self.selectTab(.home)
        homeCoordinator.present(fullScreenCover: fullscreenCover)
    }
    
    //MARK: Statistics
    func pushOnStatisticsTab(_ page: [StatisticsRoute]) {
        self.selectTab(.statistics)
        statisticsCoordinator.push(page)
    }
    
    //MARK: Wallet
    func pushOnWalletTab(_ page: [WalletRoute]) {
        self.selectTab(.wallet)
        walletCoordinator.push(page)
    }
    
    //MARK: Profile
    func pushOnProfileTab(_ page: [ProfileRoute]) {
        self.selectTab(.profile)
        profileCoordinator.push(page)
    }
}
