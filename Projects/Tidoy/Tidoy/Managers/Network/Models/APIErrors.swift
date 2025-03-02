//
//  APIErrors.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/02/2025.
//

import Foundation

enum APIError: Error, Identifiable {
    case invalidResponse
    case customError(title: String, message: String)
    case invalidObject
    case invalidJSON
    
    var id: UUID {
        UUID()
    }
    
    var title: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case let .customError(title, _):
            return title
        case .invalidObject:
            return "InvalidObject"
        case .invalidJSON:
            return "InvalidJSON"
        }
    }
    
    var message: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case let .customError(_, message):
            return message
        case .invalidObject:
            return "Failed to convert object to dictionary"
        case .invalidJSON:
            return "Failed to parse JSON into dictionary"
        }
    }
}
