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

final class AppCoordinator: ObservableObject {
    
    @Published var selectedTab: Tabs = .home
    
    func selectTab(_ tab: Tabs) {
        self.selectedTab = tab
    }
}
