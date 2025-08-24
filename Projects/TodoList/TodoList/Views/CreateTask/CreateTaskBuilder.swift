//
//  CreateTaskBuilder.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

final class CreateTaskVMFactory {
    static func makeAddTaskVM() -> CreateTaskVM {
        let repository = InMemoryTaskRepository.shared
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let router = Router.shared
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, router: router)
        return vm
    }
    
    static func makeEditTaskVM(_ editTaskId: UUID) -> EditTaskVM {
        let repository = InMemoryTaskRepository.shared
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let editTaskUseCase = EditTaskUseCase(repository: repository)
        let getTaskByIdUseCase = GetTaskByIdUseCase(repository: repository)
        let router = Router.shared
        
        var task = getTaskByIdUseCase.execute(editTaskId)  ?? TaskModel(taskDescription: "", isCompleted: false, priority: .low)
        
        let vm = EditTaskVM(existingTask: task, editTaskUseCase: editTaskUseCase, router: router)
        return vm
    }
}
