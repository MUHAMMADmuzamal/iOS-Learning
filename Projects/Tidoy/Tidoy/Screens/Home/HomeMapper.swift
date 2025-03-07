//
//  HomeMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

final class HomeMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> HomeDTO {
        // Check for errors first
        if !(200...299).contains(response.statusCode) {
            try HomeErrorMapper.map(data, response)
        }

        // Map successful response
        return try HomeDTO.decode(from: data)
    }
}
