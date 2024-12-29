//
//  TextFieldType.swift
//  Tidoy
//
//  Created by Codes Orbit on 10/08/2024.
//

import Foundation

protocol TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool
}

struct UserNameTextField: TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool {
        text.count <= 5
    }
}

struct EmailTextField: TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool {
        text.count <= 50
    }
}

struct PasswordTextField: TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool {
        text.count < 8
    }
}

struct AgeTextField: TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool {
        let age = Int(text) ?? 0
        return age <= 100
    }
}

struct PhoneTypeTextField: TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool {
        let phone = Int(text) ?? 0
        return phone <= 11
    }
}
