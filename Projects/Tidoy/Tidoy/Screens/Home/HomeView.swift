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

    @Environment(\.managedObjectContext)
    var context
    @FetchRequest(sortDescriptors: [])
    var users: FetchedResults<Users>
    
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            List(users, id: \.self) { user in
                Text(user.email ?? "Unknown")
            }
            
            Button(action: {
                let user = Users(context: context)
                // We create a user in the given context
                user.email = "ali@gmail.com"
                user.password = "12345"
                try? context.save()
                // It can now be saved with our new user
            }, label:{
                Text("Add User")
            })
            
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
