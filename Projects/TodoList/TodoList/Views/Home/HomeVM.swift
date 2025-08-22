//
//  HomeVM.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var tasks: [TaskModel] = []
    
    private let deleteTask: DeleteTaskUseCase
    private let getAllTasks: GetAllTasksUseCase
    private let toggleCompletion: ToggleTaskCompletionUseCase
    
    init(
         deleteTask: DeleteTaskUseCase,
         getAllTasks: GetAllTasksUseCase,
         toggleCompletion: ToggleTaskCompletionUseCase,
     ) {
         self.deleteTask = deleteTask
         self.getAllTasks = getAllTasks
         self.toggleCompletion = toggleCompletion
         loadTasks()
     }
    
    func loadTasks() {
        tasks = getAllTasks.execute()
    }
    
    
    func delete(_ id: UUID) {
        deleteTask.execute(id)
        loadTasks()
    }
    
    func toggleCompletionStatus(_ id: UUID) {
        toggleCompletion.execute(id)
        loadTasks()
    }
}


