//
//  CreateTask.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 19/08/2025.
//

import SwiftUI

struct CreateTask: View {
    @StateObject private var viewModel = CreateTaskVM(
        addTaskUseCase: AddTaskUseCase(repository: InMemoryTaskRepository())
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Title
                Text("Create a New Task")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Description")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    TextEditor(text: $viewModel.taskModel.taskDescription)
                        .padding()
                        .frame(height: 180)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemGray6))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                
                // Priority Picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("Priority")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Picker("Select Priority", selection: $viewModel.taskModel.priority) {
                        Text("Low").tag(Priority.low)
                        Text("Medium").tag(Priority.medium)
                        Text("High").tag(Priority.high)
                    }
                    .pickerStyle(.segmented)
                }
                
                // Add Button
                Button {
                    viewModel.addTask()
                } label: {
                    Text("Add Task")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                colors: [Color.blue, Color.purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 4)
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    CreateTask()
}
