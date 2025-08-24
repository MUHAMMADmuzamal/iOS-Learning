//
//  TaskTest.swift
//  TodoListTests
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Testing
import Foundation
@testable import TodoList


struct TaskTest {

    @Test func testAddTaskUseCase() {
        let model = TaskModel(taskDescription: "Test", isCompleted: false, priority: .low)
        let repository = MockInMemoryTaskRepository()
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        
        addTaskUseCase.execute(model)
        #expect(repository.getAll().count == 1)
        #expect(repository.getTask(by: model.id) == model)
    }
    
    @Test func testGetTaskByIdUseCase() {
        let model = TaskModel(taskDescription: "Test", isCompleted: false, priority: .low)
        let repository = MockInMemoryTaskRepository()
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let getTaskByIDUseCase = GetTaskByIdUseCase(repository: repository)
        
        addTaskUseCase.execute(model)
        
        #expect(getTaskByIDUseCase.execute(model.id) == model)
        #expect(getTaskByIDUseCase.execute(UUID()) == nil)
    }
    
    @Test func testGetAllTaskUseCase() {
        let model = TaskModel(taskDescription: "Test", isCompleted: false, priority: .low)
        let repository = MockInMemoryTaskRepository()
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        addTaskUseCase.execute(model)
        addTaskUseCase.execute(model)
        addTaskUseCase.execute(model)
        
        #expect(repository.getAll().count == 3)
    }
    
    @Test func testEditTaskUseCase() {
        let model = TaskModel(taskDescription: "Test", isCompleted: false, priority: .low)
        let repository = MockInMemoryTaskRepository()
        let addTaskUseCase = AddTaskUseCase(repository: repository)
        let editTaskUseCase = EditTaskUseCase(repository: repository)
        let getTaskByIDUseCase = GetTaskByIdUseCase(repository: repository)
        
        addTaskUseCase.execute(model)
        
        let updatedModel = TaskModel(id: model.id,taskDescription: "Updated Test", isCompleted: false, priority: .high)
        editTaskUseCase.execute(model.id, updatedModel)
        
        #expect(getTaskByIDUseCase.execute(model.id) == updatedModel)
    }

}
