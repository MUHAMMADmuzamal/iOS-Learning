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
        viewModel.fetchData()
    }
    
    var body: some View {
        VStack {
            Text("Hello, World! Home ")
            Button {
                viewModel.router.navigateToNotification()
            } label: {
                Text("Display Notification screen. ")
            }
        }
    }
}

#Preview {
    let injector = DependenciesHolder().injector()
    return HomeView(viewModel: HomeVM(router: HomeRouter(injector: injector),
                                      service: injector.resolve(HomeServiceProtocol.self)!))
}
