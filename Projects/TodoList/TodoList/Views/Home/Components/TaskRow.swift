//
//  TaskRow.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 12/08/2025.
//

import SwiftUI

protocol TaskRowDisplayable {
    var id: UUID { get }
    var taskDescription: String { get }
    var isCompleted: Bool { get }
    var priority: Priority { get }
}


struct TaskRow: View {
    let model: TaskRowDisplayable
    let onTapOfCompleteButton: (UUID) -> Void
    let onTapOfEditButton: (UUID) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            // Priority Pill
            HStack {
                Text(model.priority.title)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule().fill(model.priority.color)
                    )
                Spacer()
            }
            
            // Task Content Row
            HStack(alignment: .center, spacing: 12) {
                
                // Completion Button
                Button {
                    onTapOfCompleteButton(model.id)
                } label: {
                    Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(model.isCompleted ? .green : .gray)
                }
                .buttonStyle(.plain)
                
                // Description
                Text(model.taskDescription)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                    .strikethrough(model.isCompleted)
                
                Spacer()
                
                // Edit Button
                Button {
                    onTapOfEditButton(model.id)
                } label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.blue)
                        .padding(6)
                        .background(
                            Circle().fill(Color.blue.opacity(0.1))
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
    }
}

#Preview {
    @Previewable @State var model = TaskModel(taskDescription: "Hello world.", isCompleted: false, priority: .high)
    TaskRow(model: model) {_ in 
        model.isCompleted.toggle()
    } onTapOfEditButton: {_ in }
}
