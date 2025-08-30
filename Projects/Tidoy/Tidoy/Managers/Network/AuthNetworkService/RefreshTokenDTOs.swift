//
//  RefreshTokenDTO.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 08/03/2025.
//

import Foundation

struct RefreshTokenRequestDTO: Encodable {
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
    }
}

struct RefreshTokenResponseDTO: Decodable {
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
