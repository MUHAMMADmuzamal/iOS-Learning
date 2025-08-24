//
//  HomeVM.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published private(set) var tasks: [TaskModel] = []
    
    private let router: Router
    private let deleteTask: DeleteTaskUseCase
    private let getAllTasks: GetAllTasksUseCase
    private let toggleCompletion: ToggleTaskCompletionUseCase
    
    init(
         deleteTask: DeleteTaskUseCase,
         getAllTasks: GetAllTasksUseCase,
         toggleCompletion: ToggleTaskCompletionUseCase,
         router: Router
     ) {
         self.deleteTask = deleteTask
         self.getAllTasks = getAllTasks
         self.toggleCompletion = toggleCompletion
         self.router = router
         loadTasks()
     }
    
    func loadTasks() {
        tasks = getAllTasks.execute()
    }
    
    
    func deleteTask(_ indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let task = tasks[index]
        deleteTask.execute(task.id)
        loadTasks()
    }
    
    func toggleCompletionStatus(_ id: UUID) {
        toggleCompletion.execute(id)
        loadTasks()
    }
    
    func navigateToAddTask() {
        router.navigate(to: .createTask)
    }
    
    func navigateToEditTask(with id: UUID) {
        router.navigate(to: .editTask(id))
    }
}


