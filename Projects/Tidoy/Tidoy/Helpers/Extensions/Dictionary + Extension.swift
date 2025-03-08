//
//  Dictionary + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 01/03/2025.
//

import Foundation

// MARK: - JSON Serialization
extension Dictionary where Key == String, Value: Any {
    func toJSONData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }

    static func fromJSONData(_ data: Data) throws -> [String: Any] {
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw InvalidJSONError()
        }
        return dictionary
    }
}
