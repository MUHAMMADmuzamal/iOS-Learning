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
            VStack {
                Text("Home")
                
                Button("Push multiple pages") {
                    vm.pushMultiplePages()
                }
                
                Button("Sheet") {
                    vm.presentSheet()
                }
                
                Button("Full Screen") {
                    vm.fullScreenCover()
                }
        }
    }
}

#Preview {
    HomeView(vm: HomeViewModel(coordinator: HomeCoordinator(), appCoordinator: AppCoordinator()))
}
