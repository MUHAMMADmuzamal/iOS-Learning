//
//  HomeErrorMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 01/03/2025.
//

import Foundation
final class HomeErrorMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws {
        switch response.statusCode {
        case 401:
            _ = try ServerErrorResponse.decode(from: data)
            throw InvalidJSONError()
        case 403:
            throw CustomError(title: "Forbidden",
                               message: "You don't have permission to access this resource.")
        default:
            throw InvalidResponseError()
        }
    }
}
