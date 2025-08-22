//
//  TaskModel.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import Foundation

struct TaskModel: Identifiable, Equatable, TaskRowDisplayable {
    let id: UUID
    var taskDescription: String
    var isCompleted: Bool
    var priority: Priority
    
    init(id: UUID = UUID(), taskDescription: String, isCompleted: Bool, priority: Priority) {
        self.id = id
        self.taskDescription = taskDescription
        self.isCompleted = isCompleted
        self.priority = priority
    }
    
    static func == (lhs: TaskModel, rhs: TaskModel) -> Bool {
        lhs.id == rhs.id
        && lhs.taskDescription == rhs.taskDescription
        && lhs.isCompleted == rhs.isCompleted
        && lhs.priority == rhs.priority
    }
}
