//
//  TodoListApp.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject private var router = Router.shared
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                HomeView()
                    .navigationDestination(for: RouterPath.self) { destination in
                        switch destination {
                        case .createTask:
                            CreateTask(viewModel: CreateTaskVMFactory.makeAddTaskVM())
                        case .editTask(let id):
                            CreateTask(viewModel: CreateTaskVMFactory.makeEditTaskVM(id))
                        case .home:
                            HomeView()
                        }
                    }
            }
        }
    }
}
