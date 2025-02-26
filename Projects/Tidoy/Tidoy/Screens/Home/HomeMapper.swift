//
//  HomeMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

class HomeMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [HomeDTO] {
        if response.statusCode == 200 {
            return try JSONDecoder().decode([HomeDTO].self, from: data)
        }
        return []
    }
}
