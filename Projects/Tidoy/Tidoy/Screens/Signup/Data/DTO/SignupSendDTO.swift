//
//  SignupSendDTO.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation

struct SignupSendDTO: Codable {
    var userName: String
    var email: String
    var password: String
    var phoneNumber: String
    var selectedCountry: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
        case email
        case password
        case phoneNumber
        case selectedCountry
    }
}


struct SignupResponseDTO: Codable {
    let message: String
}
