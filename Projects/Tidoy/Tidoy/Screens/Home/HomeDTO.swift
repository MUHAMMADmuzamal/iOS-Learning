//
//  Homet DTO.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
// MARK: - HomeResponseDTO
struct HomeResponseDTO: Decodable {
    let users: UsersContainer

    enum CodingKeys: String, CodingKey {
        case users = "Users"
    }
}

struct UsersContainer: Decodable {
    let data: [User]
}

struct User: Decodable {
    let email: String
    let username: String
    let role: String
}
