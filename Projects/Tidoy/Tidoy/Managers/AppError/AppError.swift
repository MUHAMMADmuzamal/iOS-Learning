//
//  AppError.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/02/2025.
//

import Foundation

enum AppError: Error, Identifiable {
    case api(APIError)
    case network(Error)
    case unknown

    var id: UUID { UUID() }

    var title: String {
        switch self {
        case .api(let apiError): return apiError.title
        case .network(let error): return "Network Error"
        case .unknown: return "Unknown Error"
        }
    }

    var message: String {
        switch self {
        case .api(let apiError): return apiError.message
        case .network(let error): return error.localizedDescription
        case .unknown: return "An unknown error occurred."
        }
    }
}
