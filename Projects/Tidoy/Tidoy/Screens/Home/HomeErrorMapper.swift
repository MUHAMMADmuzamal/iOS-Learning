//
//  HomeErrorMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 01/03/2025.
//

import Foundation
class HomeErrorMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws {
        switch response.statusCode {
        case 401:
            let decodeData = try ServerErrorResponse.decode(from: data)
            throw APIError.invalidJSON
        case 403:
            throw APIError.customError(title: "Forbidden", message: "You don't have permission to access this resource.")
        default:
            throw APIError.invalidResponse
        }
    }
}
