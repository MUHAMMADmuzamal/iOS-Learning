//
//  HomeFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import SwiftUI

final class HomeFactory {
    static func make(coordinator: AppCoordinator) -> some View {
        VStack {
            Text("Home")
            Button("Go to wallet") {
                coordinator.pushOnWalletTab([.pages, .test])
            }
            
            Button("Sheet") {
                coordinator.homeCoordinator.present(sheet: .pages)
            }
            
            Button("Full Scren") {
                coordinator.homeCoordinator.present(fullScreenCover: .pages)
            }
        }

    }
}


struct HomeRouter {
    @ViewBuilder
    static func view(for route: HomeRoute) -> some View {
        switch route {
        case .pages: VStack {
            Button("go to wallet") {
                
            }
        }
        case .test: Text("Test")
        }
    }
    
    @ViewBuilder
    static func sheet(for route: HomeRoute) -> some View {
        switch route {
        case .pages: Text("Pages Sheet")
        case .test: Text("Test Sheet")
        }
    }
    
    @ViewBuilder
    static func fullScreenCover(for route: HomeRoute) -> some View {
        switch route {
        case .pages: Text("Pages Full Screen")
        case .test: Text("Test Full Screen")
        }
    }
}
