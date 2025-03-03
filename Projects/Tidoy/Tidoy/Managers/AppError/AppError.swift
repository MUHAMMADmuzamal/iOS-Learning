//
//  AppError.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/02/2025.
//

import Foundation

enum AppError: Error, Identifiable {
    case api(APIError)
    case network
    case unknown

    var id: UUID { UUID() }

    var title: String {
        switch self {
        case .api(let apiError): return apiError.title
        case .network: return "Network Not Reachable"
        case .unknown: return "Unknown Error"
        }
    }

    var message: String {
        switch self {
        case .api(let apiError): return apiError.message
        case .network: return "Check your internet connection and try again."
        case .unknown: return "An unknown error occurred."
        }
    }
}
