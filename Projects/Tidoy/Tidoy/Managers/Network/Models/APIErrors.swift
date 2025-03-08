//
//  APIErrors.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/02/2025.
//

import Foundation

class InvalidResponseError: AppError {
    init() {
        super.init(title: "Invalid Response",
                   message: "The server returned an unexpected response.")
    }
}

class InvalidObjectError: AppError {
    init() {
        super.init(title: "Invalid Object",
                   message: "Failed to convert object to dictionary.")
    }
}

class InvalidJSONError: AppError {
    init() {
        super.init(title: "JSON Parsing Error",
                   message: "Failed to parse the JSON response from the server.")
    }
}

class UnAuthorizedError: AppError {
    init() {
        super.init(title: "UnAuthorized",
                   message: "You are not authorized to access this resource. Please log in again.")
    }
}

class RefreshTokenExpiredError: AppError {
    init() {
        super.init(title: "Session Expired",
                   message: "Your session has expired. Please log in again.")
    }
}

