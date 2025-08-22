//
//  HomeView.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm: HomeViewModel = HomeViewModelBuilder.build()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Title
            VStack(alignment: .leading, spacing: 4) {
                Text("My Tasks")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Text("\(vm.tasks.count) task\(vm.tasks.count == 1 ? "" : "s")")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
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
                            print("Edit tapped for \(id)")
                        }
                    )
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
            .padding(.horizontal)
        }
        .background(Color(.systemGroupedBackground))
    }
}


#Preview {
    HomeView()
}
