//
//  AppError.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/02/2025.
//

import Foundation

class AppError: Error {
    var title: String
    var message: String
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}

class NetworkError: AppError {
    init() {
        super.init(title: "Network Error",
                   message: "Please check your internet connection and try again.")
    }
}

class UnknownError: AppError {
    
    override init(title: String, message: String) {
        super.init(title: title,
                   message: message)
    }
    
    init() {
        super.init(title: "Unknown Error",
                   message: "An unexpected error occurred. Please try again later.")
    }
}

class CustomError: AppError {
    override init(title: String, message: String) {
        super.init(title: title, message: message)
    }
}

