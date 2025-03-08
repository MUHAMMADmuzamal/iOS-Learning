//
//  Encodeable + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 01/03/2025.
//

import Foundation

extension Encodable {
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }
    
    func toQueryItems() throws -> [URLQueryItem] {
          // Convert the object to JSON data
          let encoder = JSONEncoder()
          let data = try encoder.encode(self)
          
          // Convert the JSON data to a dictionary
          guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
              throw InvalidJSONError()
          }
          
          // Map the dictionary to URLQueryItem
          let queryItems = dictionary.map { key, value in
              URLQueryItem(name: key, value: "\(value)")
          }
          
          return queryItems
      }
}
