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
        
        if response.statusCode == 401 {
            let decodeData = try JSONDecoder().decode(ServerErrorResponse.self, from: data)
            throw APIError.customError(title: "\(decodeData.error ?? "Error")", message: "\(decodeData.message ?? "")")
        }
        return []
    }
}
