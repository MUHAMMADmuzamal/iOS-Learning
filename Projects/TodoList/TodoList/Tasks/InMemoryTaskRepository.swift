//
//  InMemoryTaskRepository.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation


final class InMemoryTaskRepository: TaskRepository {
    
    static let shared = InMemoryTaskRepository()
    private init(){}
    
    private var tasks: [TaskModel] = [
        TaskModel(id: UUID(), taskDescription: "Buy milk", isCompleted: false, priority: .high),
        TaskModel(id: UUID(), taskDescription: "Learn SwiftUI", isCompleted: true, priority: .medium),
    ]
    
    func add(_ task: TaskModel) {
        tasks.append(task)
    }
    
    func delete(_ id: UUID) {
        tasks.removeAll { $0.id == id }
    }
    
    func update(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        }
    }
    
    func getTask(by id: UUID) -> TaskModel? {
        tasks.first { $0.id == id }
    }
    
    func getAll() -> [TaskModel] {
        tasks
    }
    
    func updateTask(id: UUID, with newTask: TaskModel) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index] = newTask
    }
}


final class MockInMemoryTaskRepository: TaskRepository {
    private var tasks: [TaskModel] = []
    
    func add(_ task: TaskModel) {
        tasks.append(task)
    }
    
    func delete(_ id: UUID) {
        tasks.removeAll { $0.id == id }
    }
    
    func update(_ task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        }
    }
    
    func getTask(by id: UUID) -> TaskModel? {
        tasks.first { $0.id == id }
    }
    
    func getAll() -> [TaskModel] {
        tasks
    }
    
    func updateTask(id: UUID, with newTask: TaskModel) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index] = newTask
    }
    
}
