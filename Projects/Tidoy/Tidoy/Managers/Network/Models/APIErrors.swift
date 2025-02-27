//
//  APIErrors.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/02/2025.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case customError(title: String, message: String)
    
    var title: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case let .customError(title, _):
            return title
        }
    }
    
    var message: String {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case let .customError(_, message):
            return message
        }
    }
}
