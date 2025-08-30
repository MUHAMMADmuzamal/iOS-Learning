//
//  LoginMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation

final class LoginMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> LoginResponseDTO {
        
        if !(200...299).contains(response.statusCode) {
            try LoginErrorMapper.map(data, response)
        }
        
        return try LoginResponseDTO.decode(from: data)
    }
}
