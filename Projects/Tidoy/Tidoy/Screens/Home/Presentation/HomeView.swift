//
//  HomeView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI
import CoreData

struct HomeView<VM: HomeVMProtocol>: View {
    @StateObject private var viewModel: VM
    
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            List(viewModel.users, id: \.self) { user in
                Text(user.email)
            }
            
            Text("Hello, World! Home ")
            Button {
                viewModel.router.navigateToNotification()
            } label: {
                Text("Display Notification screen. ")
            }
        }.onAppear {
            viewModel.fetchData()
        }
        .modelAlert(isPresented: $viewModel.isPresentError, model: CustomAlertModel(
            title:viewModel.appError?.title ?? "Error",
            message: viewModel.appError?.message ?? "Some thing went wrong!",
            primaryButtonTitle: "OK",
            primaryAction: { print("OK Pressed") },
            secondaryButtonTitle: "Cancel",
            secondaryAction: { print("Cancel Pressed")})
        )
    }
}

#Preview {
    let injector = DependenciesHolder.shared.injector()
    return HomeView(viewModel: HomeVM(router: HomeRouter(injector: injector),
                                      useCase: injector.resolve(HomeUseCaseProtocol.self)!,
                                      logger: injector.resolve(RemoteLogger.self)!))
}
