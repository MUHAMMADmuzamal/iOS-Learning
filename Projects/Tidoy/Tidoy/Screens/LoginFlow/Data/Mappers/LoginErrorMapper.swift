//
//  LoginErrorMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
final class LoginErrorMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws {
        switch response.statusCode {
        default:
            throw InvalidResponseError()
        }
    }
}
