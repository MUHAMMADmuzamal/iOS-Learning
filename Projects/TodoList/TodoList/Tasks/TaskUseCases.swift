//
//  TaskUseCases.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

struct AddTaskUseCase {
    let repository: TaskRepository
    func execute(_ task: TaskModel) {
        repository.add(task)
    }
}

struct GetAllTasksUseCase {
    let repository: TaskRepository
    func execute() -> [TaskModel] {
        let allTasks = repository.getAll()
        var completedTasks: [TaskModel] = []
        var notCompletedTasks: [TaskModel] = []
        
        for task in allTasks {
            if task.isCompleted {
                completedTasks.append(task)
            }else {
                notCompletedTasks.append(task)
            }
        }
        completedTasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
        notCompletedTasks.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
        return notCompletedTasks + completedTasks
    }
}

struct GetTaskByIdUseCase {
    let repository: TaskRepository
    func execute(_ id: UUID) -> TaskModel? {
        repository.getTask(by: id)
    }
}

struct EditTaskUseCase {
    let repository: TaskRepository

    func execute(_ id: UUID, _ newTask: TaskModel) {
        repository.updateTask(id: id, with: newTask)
    }
}

struct DeleteTaskUseCase {
    let repository: TaskRepository
    func execute(_ id: UUID) {
        repository.delete(id)
    }
}

struct ToggleTaskCompletionUseCase {
    let repository: TaskRepository
    func execute(_ id: UUID) {
        if var task = repository.getTask(by: id) {
            task.isCompleted.toggle()
            repository.update(task)
        }
    }
}


