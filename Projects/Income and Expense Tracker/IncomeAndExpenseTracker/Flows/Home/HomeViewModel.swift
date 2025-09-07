//
//  HomeViewModel.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    var coordinator: HomeCoordinator
    var appCoordinator: AppCoordinator
    
    init(coordinator: HomeCoordinator,
         appCoordinator: AppCoordinator) {
        self.coordinator = coordinator
        self.appCoordinator = appCoordinator
    }    
    
    func pushMultiplePages() {
        coordinator.push([.pages, .pages, .pages, .test])
    }
    
    func presentSheet() {
        coordinator.present(sheet: .pages)
    }
    
    func fullScreenCover() {
        coordinator.present(fullScreenCover: .pages)
    }
}
