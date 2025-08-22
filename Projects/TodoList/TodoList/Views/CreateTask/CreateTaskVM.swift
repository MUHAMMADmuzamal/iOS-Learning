//
//  CreateTaskVM.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

class CreateTaskVM: ObservableObject {
    
    @Published var taskModel: TaskModel = TaskModel(taskDescription: "", isCompleted: false, priority: .low)
    
    private var addTaskUseCase: AddTaskUseCase
    
    init(addTaskUseCase: AddTaskUseCase) {
        self.addTaskUseCase = addTaskUseCase
    }
    
    func addTask() {
        self.addTaskUseCase.execute(taskModel)
    }
}
