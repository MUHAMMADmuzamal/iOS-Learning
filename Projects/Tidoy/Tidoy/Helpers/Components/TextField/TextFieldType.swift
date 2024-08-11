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

struct AgeTextField: TextFieldTypeProtocol {
    func isValid(for text: String) -> Bool {
        let age = Int(text) ?? 0
        return age <= 100
    }
}
