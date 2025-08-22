//
//  HomeBuilder.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

struct HomeViewModelBuilder {
    static func build() -> HomeViewModel {
        let repository = InMemoryTaskRepository()
        
        let deleteTask = DeleteTaskUseCase(repository: repository)
        let getAllTasks = GetAllTasksUseCase(repository: repository)
        let toggleCompletion = ToggleTaskCompletionUseCase(repository: repository)
        
        return HomeViewModel(
            deleteTask: deleteTask,
            getAllTasks: getAllTasks,
            toggleCompletion: toggleCompletion,
        )
    }
}
