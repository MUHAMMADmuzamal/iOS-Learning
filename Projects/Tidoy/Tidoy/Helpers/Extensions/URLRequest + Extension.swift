//
//  URLRequest + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 04/03/2025.
//

import Foundation

extension URLRequest {
    func log() {
        let bodyString: String

        if let bodyData = httpBody,
           let jsonObject = try? JSONSerialization.jsonObject(with: bodyData, options: []),
           let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let prettyJSON = String(data: prettyData, encoding: .utf8) {
            bodyString = prettyJSON // Pretty-printed JSON
        } else {
            bodyString = httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? "nil"
        }

        print("""
        🔹 URLRequest Debug:
        --------------------------------
        🌍 URL: \(url?.absoluteString ?? "nil")
        🛑 Method: \(httpMethod ?? "nil")
        📋 Headers: \(allHTTPHeaderFields ?? [:])
        📦 Body:
        \(bodyString)
        --------------------------------
        """)
    }
}

