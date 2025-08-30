//
//  SignupMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation

final class SignupMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> SignupResponseDTO {
        // Check for errors first
        if !(200...299).contains(response.statusCode) {
            try SignupErrorMapper.map(data, response)
        }

        // Map successful response
        return try SignupResponseDTO.decode(from: data)
    }
}
