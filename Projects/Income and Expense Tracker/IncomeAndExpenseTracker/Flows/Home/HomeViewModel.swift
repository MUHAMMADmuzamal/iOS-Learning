//
//  HomeViewModel.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    var coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    
    func navigateToWallet() {
//        coordinator.pushOnWalletTab([.pages, .test])
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
