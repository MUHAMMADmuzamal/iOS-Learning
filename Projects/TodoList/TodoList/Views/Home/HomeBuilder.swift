//
//  HomeBuilder.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

struct HomeViewModelFactory {
    static func make() -> HomeViewModel {
        let repository = InMemoryTaskRepository.shared
        
        let deleteTask = DeleteTaskUseCase(repository: repository)
        let getAllTasks = GetAllTasksUseCase(repository: repository)
        let toggleCompletion = ToggleTaskCompletionUseCase(repository: repository)
        
        return HomeViewModel(
            deleteTask: deleteTask,
            getAllTasks: getAllTasks,
            toggleCompletion: toggleCompletion, router: Router.shared,
        )
    }
}
