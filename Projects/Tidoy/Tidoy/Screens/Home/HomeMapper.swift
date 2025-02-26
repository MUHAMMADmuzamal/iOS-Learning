//
//  HomeMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

class HomeMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [UserElement] {
        if response.statusCode == 200 {
            return try JSONDecoder().decode([UserElement].self, from: data)
        }
        return []
    }
}
