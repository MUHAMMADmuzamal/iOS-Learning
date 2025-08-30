//
//  CreateTaskVMTests.swift
//  TodoListTests
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Testing
import Foundation
@testable import TodoList

// MARK: - Mock Router
final class MockRouter: RouterProtocol, ObservableObject {
    @Published var path: [RouterPath] = []
    var navigateBackCalled = false
    var navigateToDestination: RouterPath?
    
    func navigate(to destination: RouterPath) {
        navigateToDestination = destination
        path.append(destination)
    }
    
    func navigateBack() {
        navigateBackCalled = true
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func navigateBackToRoute() {
        // Implementation if needed
    }
    
    func navigateAndRemoveAll(to destination: RouterPath) {
        path = [destination]
    }
    
    func navigateAndReplaceCurrent(to destination: RouterPath) {
        if !path.isEmpty {
            path.removeLast()
        }
        path.append(destination)
    }
    
    func navigateToRoot() {
        if !path.isEmpty {
            path = [path[0]]
        }
    }
}

struct CreateTaskVMTests {
    
    // MARK: - CreateTaskVM Tests
    
    @Test func testCreateTaskVM_InitialState() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let addTaskUseCase = AddTaskUseCase(repository: mockRepository)
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, router: mockRouter)
        
        // Test initial state
        #expect(vm.buttonTitle == "Add Task")
        #expect(vm.taskModel.taskDescription == "")
        #expect(vm.taskModel.isCompleted == false)
        #expect(vm.taskModel.priority == .low)
    }
    
    @Test func testCreateTaskVM_SaveTask() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let addTaskUseCase = AddTaskUseCase(repository: mockRepository)
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, router: mockRouter)
        
        // Set task data
        let testTask = TaskModel(
            id: UUID(),
            taskDescription: "Test Task",
            isCompleted: false,
            priority: .high
        )
        vm.taskModel = testTask
        
        // Save task
        vm.saveTask()
        
        // Verify task was added to repository
        #expect(mockRepository.getAll().count == 1)
        #expect(mockRepository.getTask(by: testTask.id) == testTask)
        
        // Verify router navigation was called
        #expect(mockRouter.navigateBackCalled == true)
    }
    
    @Test func testCreateTaskVM_UpdateTaskModel() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let addTaskUseCase = AddTaskUseCase(repository: mockRepository)
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, router: mockRouter)
        
        // Update task description
        vm.taskModel.taskDescription = "Updated Description"
        #expect(vm.taskModel.taskDescription == "Updated Description")
        
        // Update priority
        vm.taskModel.priority = .medium
        #expect(vm.taskModel.priority == .medium)
        
        // Update completion status
        vm.taskModel.isCompleted = true
        #expect(vm.taskModel.isCompleted == true)
    }
    
    // MARK: - EditTaskVM Tests
    
    @Test func testEditTaskVM_InitialState() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let editTaskUseCase = EditTaskUseCase(repository: mockRepository)
        
        let existingTask = TaskModel(
            id: UUID(),
            taskDescription: "Existing Task",
            isCompleted: true,
            priority: .medium
        )
        
        let vm = EditTaskVM(
            existingTask: existingTask,
            editTaskUseCase: editTaskUseCase,
            router: mockRouter
        )
        
        // Test initial state
        #expect(vm.buttonTitle == "Edit Task")
        #expect(vm.taskModel == existingTask)
        #expect(vm.taskModel.taskDescription == "Existing Task")
        #expect(vm.taskModel.isCompleted == true)
        #expect(vm.taskModel.priority == .medium)
    }
    
    @Test func testEditTaskVM_SaveTask() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let editTaskUseCase = EditTaskUseCase(repository: mockRepository)
        
        let existingTask = TaskModel(
            id: UUID(),
            taskDescription: "Original Task",
            isCompleted: false,
            priority: .low
        )
        
        let vm = EditTaskVM(
            existingTask: existingTask,
            editTaskUseCase: editTaskUseCase,
            router: mockRouter
        )
        
        // First add the task to repository
        mockRepository.add(existingTask)
        #expect(mockRepository.getAll().count == 1)
        
        // Update the task
        let updatedTask = TaskModel(
            id: existingTask.id,
            taskDescription: "Updated Task Description",
            isCompleted: true,
            priority: .high
        )
        vm.taskModel = updatedTask
        
        // Save the updated task
        vm.saveTask()
        
        // Verify task was updated in repository
        let savedTask = mockRepository.getTask(by: existingTask.id)
        #expect(savedTask != nil)
        #expect(savedTask?.taskDescription == "Updated Task Description")
        #expect(savedTask?.isCompleted == true)
        #expect(savedTask?.priority == .high)
        
        // Verify router navigation was called
        #expect(mockRouter.navigateBackCalled == true)
    }
    
    @Test func testEditTaskVM_UpdateTaskProperties() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let editTaskUseCase = EditTaskUseCase(repository: mockRepository)
        
        let existingTask = TaskModel(
            id: UUID(),
            taskDescription: "Original Task",
            isCompleted: false,
            priority: .low
        )
        
        let vm = EditTaskVM(
            existingTask: existingTask,
            editTaskUseCase: editTaskUseCase,
            router: mockRouter
        )
        
        // Update individual properties
        vm.taskModel.taskDescription = "New Description"
        #expect(vm.taskModel.taskDescription == "New Description")
        
        vm.taskModel.priority = .high
        #expect(vm.taskModel.priority == .high)
        
        vm.taskModel.isCompleted = true
        #expect(vm.taskModel.isCompleted == true)
    }
    
    // MARK: - Integration Tests
    
    @Test func testCreateTaskVM_WithRealUseCase() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let addTaskUseCase = AddTaskUseCase(repository: mockRepository)
        
        let vm = CreateTaskVM(addTaskUseCase: addTaskUseCase, router: mockRouter)
        
        // Create and save multiple tasks
        let task1 = TaskModel(taskDescription: "Task 1", isCompleted: false, priority: .low)
        let task2 = TaskModel(taskDescription: "Task 2", isCompleted: true, priority: .high)
        
        vm.taskModel = task1
        vm.saveTask()
        
        vm.taskModel = task2
        vm.saveTask()
        
        // Verify both tasks were saved
        #expect(mockRepository.getAll().count == 2)
        #expect(mockRouter.navigateBackCalled == true)
    }
    
    @Test func testEditTaskVM_WithRealUseCase() {
        let mockRepository = MockInMemoryTaskRepository()
        let mockRouter = MockRouter()
        let editTaskUseCase = EditTaskUseCase(repository: mockRepository)
        
        // Create initial task
        let initialTask = TaskModel(taskDescription: "Initial", isCompleted: false, priority: .low)
        mockRepository.add(initialTask)
        
        let vm = EditTaskVM(
            existingTask: initialTask,
            editTaskUseCase: editTaskUseCase,
            router: mockRouter
        )
        
        // Edit and save
        vm.taskModel.taskDescription = "Modified"
        vm.taskModel.priority = .high
        vm.saveTask()
        
        // Verify changes
        let savedTask = mockRepository.getTask(by: initialTask.id)
        #expect(savedTask?.taskDescription == "Modified")
        #expect(savedTask?.priority == .high)
        #expect(mockRouter.navigateBackCalled == true)
    }
}
