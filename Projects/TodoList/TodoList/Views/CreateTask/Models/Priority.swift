//
//  PriorityModel.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import SwiftUI

enum Priority: String {
    case low, medium, high
}

extension Priority {
    var color: Color {
        switch self {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
}
