//
//  Homet DTO.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 26/02/2025.
//

import Foundation
// MARK: - HomeDTO
struct HomeDTO: Codable {
    let createdAt, name: String?
    let avatar: String?
    let accessToken, refreshToken, id: String?
}
