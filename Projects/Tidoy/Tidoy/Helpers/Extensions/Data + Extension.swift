//
//  Data + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 08/03/2025.
//

import Foundation

extension Data {
    func log() {
        print("🟢🔽🔽🔽 START JSON RESPONSE 🔽🔽🔽🟢")
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
           let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyString = String(data: prettyData, encoding: .utf8) {
            print(prettyString)
        } else if let rawString = String(data: self, encoding: .utf8) {
            print("🟡 Raw Data (Not JSON):\n\(rawString)")
        } else {
            print("❌ Invalid Data: Unable to convert to string")
        }
        
        print("🔴🔼🔼🔼 END JSON RESPONSE 🔼🔼🔼🔴")
    }
}

