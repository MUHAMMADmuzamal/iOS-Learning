//
//  HomeRouter.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import SwiftUI


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
