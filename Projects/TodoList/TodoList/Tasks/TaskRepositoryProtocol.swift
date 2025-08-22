//
//  TaskRepositoryProtocol.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation

protocol TaskRepository {
    func add(_ task: TaskModel)
    func delete(_ id: UUID)
    func update(_ task: TaskModel)
    func getTask(by id: UUID) -> TaskModel?
    func getAll() -> [TaskModel]
    func updateTask(id: UUID, with newTask: TaskModel)
}
