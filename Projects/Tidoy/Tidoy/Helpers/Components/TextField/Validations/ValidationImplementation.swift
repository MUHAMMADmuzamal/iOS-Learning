//
//  Validation.swift
//  Tidoy
//
//  Created by Codes Orbit on 06/02/2025.
//

import Foundation

struct EmailValidator: Validatable {
    func validate(_ text: String) -> Bool {
        // Regular expression for basic email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return !text.isEmpty && emailPredicate.evaluate(with: text)
    }
}

struct UsernameValidator: Validatable {
    func validate(_ text: String) -> Bool {
        // Username must be at least 3 characters and contain only alphanumeric characters
        let usernameRegex = "^[a-zA-Z0-9]{3,20}$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return !text.isEmpty && usernamePredicate.evaluate(with: text)
    }
}

struct PhoneNumberValidator: Validatable {
    func validate(_ text: String) -> Bool {
        // Regular expression for basic phone number validation
        // Supports formats like: +1234567890, 123-456-7890, (123) 456-7890, etc.
        let phoneRegex = "^\\+?\\d{1,4}?[-.\\s]?\\(?\\d{1,3}?\\)?[-.\\s]?\\d{1,4}[-.\\s]?\\d{1,4}[-.\\s]?\\d{1,9}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return !text.isEmpty && phonePredicate.evaluate(with: text)
    }
}

struct PasswordValidator: Validatable {
    func validate(_ text: String) -> Bool {
        // Password must be at least 8 characters, with at least one uppercase, 
        //one lowercase, one digit, and one special character
        let passwordRegex =
        "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return !text.isEmpty && passwordPredicate.evaluate(with: text)
    }
}
