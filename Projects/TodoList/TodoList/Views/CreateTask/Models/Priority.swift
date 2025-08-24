//
//  PriorityModel.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 09/08/2025.
//

import SwiftUI

enum Priority: Int {
    case low = 0, medium, high
}

extension Priority {
    var color: Color {
        switch self {
        case .low: return .green
        case .medium: return .yellow
        case .high: return .red
        }
    }
    
    var title: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
}
