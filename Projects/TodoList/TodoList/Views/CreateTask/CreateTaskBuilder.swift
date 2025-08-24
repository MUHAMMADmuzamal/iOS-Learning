//
//  CreateTaskBuilder.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

final class CreateTaskVMBuilder {
    static func build(_ editTaskId: UUID? = nil) -> CreateTaskVM {
        let repository = InMemoryTaskRepository.shared
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let editTaskUseCase = EditTaskUseCase(repository: repository)
        let getTaskByIdUseCase = GetTaskByIdUseCase(repository: repository)
        let router = Router.shared
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, editTaskUseCase: editTaskUseCase, getTaskByIdUseCase: getTaskByIdUseCase, router: router)
        vm.loadTask(id: editTaskId)
        return vm
    }
}
