//
//  HomeView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct HomeView<VM: HomeVMProtocol>: View {
    @StateObject private var viewModel: VM

    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
        .alert(viewModel.appError?.title ?? "", isPresented: $viewModel.isPresentError, actions: {
            // actions
        }, message: {
            Text(viewModel.appError?.message ?? "")
        })
    }
}

#Preview {
    let injector = DependenciesHolder.shared.injector()
    return HomeView(viewModel: HomeVM(router: HomeRouter(injector: injector),
                                      useCase: injector.resolve(HomeUseCaseProtocol.self)!,
                                      logger: injector.resolve(RemoteLogger.self)!))
}
