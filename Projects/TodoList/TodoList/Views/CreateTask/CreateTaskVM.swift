//
//  CreateTaskVM.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

protocol TaskFormVM: ObservableObject {
    var taskModel: TaskModel { get set }
    var buttonTitle: String { get }
    func saveTask()
}

final class CreateTaskVM: TaskFormVM {
    @Published var taskModel = TaskModel(taskDescription: "", isCompleted: false, priority: .low)
    var buttonTitle: String { "Add Task" }
    
    private var addTaskUseCase: AddTaskUseCase
    private var router: RouterProtocol
    
    init(addTaskUseCase: AddTaskUseCase,
         router: RouterProtocol) {
        self.addTaskUseCase = addTaskUseCase
        self.router = router
    }
    
    func saveTask() {
        self.addTaskUseCase.execute(taskModel)
        router.navigateBack()
    }
}

final class EditTaskVM: TaskFormVM {
    @Published var taskModel: TaskModel
    var buttonTitle: String { "Edit Task" }
    
    private var editTaskUseCase: EditTaskUseCase
    private var router: RouterProtocol
    
    init(existingTask: TaskModel,
         editTaskUseCase: EditTaskUseCase,
         router: RouterProtocol) {
        
        self.taskModel = existingTask
        self.editTaskUseCase = editTaskUseCase
        self.router = router
    }
    
    func saveTask() {
        self.editTaskUseCase.execute(taskModel.id, taskModel)
        router.navigateBack()
    }
}
