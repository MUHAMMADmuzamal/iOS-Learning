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
        let repository =  InMemoryTaskRepository()
        let vm = CreateTaskVM(addTaskUseCase: AddTaskUseCase(repository: repository))
        let model = TaskModel(id: UUID(), taskDescription: "Test", isCompleted: false, priority: .low)
        vm.taskModel = model
        vm.addTask()
        
        let getTaskUseCase = GetTaskByIdUseCase(repository: repository)
        #expect(vm.taskModel == model)
        #expect(getTaskUseCase.execute(model.id) == model)
        
    }

}
