//
//  HomeView.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm: HomeViewModel = HomeViewModelFactory.make()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Header with Title + Add Button
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("My Tasks")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Text("\(vm.tasks.count) task\(vm.tasks.count == 1 ? "" : "s")")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button {
                    vm.navigateToAddTask()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(
                            Circle()
                                .fill(LinearGradient(
                                    colors: [Color.blue, Color.purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                        )
                        .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            // Task List
            List {
                ForEach(vm.tasks) { task in
                    TaskRow(
                        model: task,
                        onTapOfCompleteButton: { id in
                            vm.toggleCompletionStatus(id)
                        },
                        onTapOfEditButton: { id in
                            vm.navigateToEditTask(with: id)
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical, 4)
                    .background(Color(.systemGroupedBackground))
                }
                .onDelete(perform: vm.deleteTask)
            }
            .listStyle(.plain)
            .background(Color(.systemGroupedBackground))
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .onAppear(perform: vm.loadTasks)
    }
}


#Preview {
    HomeView()
}
