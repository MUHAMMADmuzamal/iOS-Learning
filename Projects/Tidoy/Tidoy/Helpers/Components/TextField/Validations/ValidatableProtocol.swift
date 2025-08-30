//
//  ValidatableProtocol.swift
//  Tidoy
//
//  Created by Codes Orbit on 06/02/2025.
//

import Foundation

protocol Validatable {
    func validate(_ text: String) -> Bool
}
