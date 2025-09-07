//
//  HomeFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import SwiftUI

final class HomeFactory {
    static func make(coordinator: HomeCoordinator, appCoordinator: AppCoordinator) -> some View {
        HomeView(vm: HomeViewModel(coordinator: coordinator, appCoordinator: appCoordinator))
    }
}
