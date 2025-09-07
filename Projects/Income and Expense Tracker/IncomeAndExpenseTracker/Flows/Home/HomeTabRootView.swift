//
//  HomeView.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel
    
    init(vm: HomeViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
//        NavigationStack(path: $vm.coordinator.path) {
            VStack {
                Text("Home")
                
                Button("Go to Wallet") {
                    vm.navigateToWallet()
                }
                
                Button("Push multiple pages") {
                    vm.pushMultiplePages()
                }
                
                Button("Sheet") {
                    vm.presentSheet()
                }
                
                Button("Full Screen") {
                    vm.fullScreenCover()
                }
//            }
//            .navigationDestination(for: HomeRoute.self) { route in
//                HomeRouter.view(for: route)
//            }
//            .sheet(item: $vm.coordinator.sheet) { route in
//                HomeRouter.sheet(for: route)
//            }
//            .fullScreenCover(item: $vm.coordinator.fullScreenCover) { route in
//                HomeRouter.fullScreenCover(for: route)
//            }
        }
    }
}

#Preview {
    HomeView(vm: HomeViewModel(coordinator: HomeCoordinator()))
}
