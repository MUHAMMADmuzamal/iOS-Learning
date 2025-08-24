//
//  CreateTaskVM.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

class CreateTaskVM: ObservableObject {
    
    @Published var taskModel: TaskModel = TaskModel(taskDescription: "", isCompleted: false, priority: .low)
    @Published var editTask: Bool = false
    
    private var addTaskUseCase: AddTaskUseCase
    private var editTaskUseCase: EditTaskUseCase
    private var getTaskByIdUseCase: GetTaskByIdUseCase
    private var router: Router
    
    init(addTaskUseCase: AddTaskUseCase,
         editTaskUseCase: EditTaskUseCase,
         getTaskByIdUseCase: GetTaskByIdUseCase,
         router: Router) {
        
        self.addTaskUseCase = addTaskUseCase
        self.editTaskUseCase = editTaskUseCase
        self.getTaskByIdUseCase = getTaskByIdUseCase
        self.router = router
    }
    
    func addTask() {
        self.addTaskUseCase.execute(taskModel)
        router.navigateBack()
    }
    
    func updateTask() {
        self.editTaskUseCase.execute(taskModel.id, taskModel)
        router.navigateBack()
    }
    
    func loadTask(id: UUID?) {
        guard let id = id else { return }
        editTask = true
        let task  = getTaskByIdUseCase.execute(id)
        
        if let task = task {
            self.taskModel = task
        }
    }
}
