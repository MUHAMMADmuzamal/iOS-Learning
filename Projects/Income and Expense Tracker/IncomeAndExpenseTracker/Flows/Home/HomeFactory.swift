//
//  HomeFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import SwiftUI
import Swinject

final class HomeFactory {
    static func make(injector: Container) -> some View {
        let coordinator = injector.resolve(HomeCoordinator.self)!
        let appCoordinator = injector.resolve(AppCoordinator.self)!
        return HomeView(vm: HomeViewModel(coordinator: coordinator, appCoordinator: appCoordinator))
    }
}
