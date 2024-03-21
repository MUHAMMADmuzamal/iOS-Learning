//
//  Dictonory-Ext.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation

extension Dictionary {
    func getJsonData() -> Data? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self)
        return jsonData
    }
    func getQueryItems() -> [URLQueryItem] {
        return self.map { URLQueryItem(name: String(describing: $0.key), value: String(describing: $0.value)) }
    }
}
