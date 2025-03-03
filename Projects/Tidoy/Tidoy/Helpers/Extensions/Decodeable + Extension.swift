//
//  Decode + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 01/03/2025.
//

import Foundation

extension Decodable {
    static func decode(from data: Data) throws -> Self {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Self.self, from: data)
        } catch {
            throw APIError.invalidJSON
        }
    }
}
