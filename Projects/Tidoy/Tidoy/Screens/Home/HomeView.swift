//
//  HomeView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct HomeView: View {
    private var viewModel: HomeVMProtocol!
    
    init(viewModel: HomeVMProtocol!) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Hello, World! Home ")
            Button {
                viewModel.router.navigateToNotification()
            } label: {
                Text("Display Notification screen. ")
            }
        }.onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    let injector = DependenciesHolder.shared.injector()
    return HomeView(viewModel: HomeVM(router: HomeRouter(injector: injector),
                                      useCase: injector.resolve(HomeUseCaseProtocol.self)!))
}
