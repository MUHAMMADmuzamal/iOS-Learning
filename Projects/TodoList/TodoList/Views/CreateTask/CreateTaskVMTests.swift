//
//  CreateTaskVMTests.swift
//  TodoListTests
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Testing
import Foundation
@testable import TodoList

struct CreateTaskVMTests {

    @Test func testAddTask() {
        let repository =  MockInMemoryTaskRepository()
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let editTaskUseCase = EditTaskUseCase(repository: repository)
        let getTaskByIdUseCase = GetTaskByIdUseCase(repository: repository)
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, editTaskUseCase: editTaskUseCase, getTaskByIdUseCase: getTaskByIdUseCase)
        
        let model = TaskModel(id: UUID(), taskDescription: "Test", isCompleted: false, priority: .low)
        vm.taskModel = model
        vm.addTask()
        
        let getTaskUseCase = GetTaskByIdUseCase(repository: repository)
        #expect(vm.taskModel == model)
        #expect(getTaskUseCase.execute(model.id) == model)
        
    }
    
    @Test func testEditTask() {
        // Add Tasks
        let repository =  MockInMemoryTaskRepository()
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let editTaskUseCase = EditTaskUseCase(repository: repository)
        let getTaskByIdUseCase = GetTaskByIdUseCase(repository: repository)
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, editTaskUseCase: editTaskUseCase, getTaskByIdUseCase: getTaskByIdUseCase)
        
        // save first to Db
        let model = TaskModel(id: UUID(), taskDescription: "Test", isCompleted: false, priority: .low)
        vm.taskModel = model
        vm.addTask()
        
        
        let updatedModel = TaskModel(id: model.id, taskDescription: "Updated Test", isCompleted: true, priority: .low)
       
        // Verify Updated Task
        vm.loadTask(id: model.id)
        #expect(vm.taskModel ==  model)
        
        vm.taskModel = updatedModel
        vm.updateTask()
        
        #expect(getTaskByIdUseCase.execute(model.id) == updatedModel)
        
    }
    
    

}
