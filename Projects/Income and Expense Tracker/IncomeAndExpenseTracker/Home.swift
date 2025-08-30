//
//  Home.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI

struct Home: View {
    @StateObject var coordinator = HomeCoordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Button("Notification"){
                    coordinator.push(.notifications)
                }.padding()
                
                Button("Sheet"){
                    coordinator.present(sheet: .addExpense)
                }.padding()
                
                Button("Full Screen Cover"){
                    coordinator.present(fullScreenCover:.calendar)
                }.padding()
                
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomePage.self) { page in
                coordinator.build(page: page)
            }
            .sheet(item: $coordinator.sheet) { sheet in
                coordinator.build(sheet: sheet)
            }
            .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreen in
                coordinator.build(fullScreen: fullScreen)
            }
        }
    }
}

#Preview {
    Home()
}
