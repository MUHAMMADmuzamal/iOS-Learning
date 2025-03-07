//
//  URLRequest + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 04/03/2025.
//

import Foundation

extension URLRequest {
    func log() {
        let bodyString = httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? "nil"
        print("""
        🔹 URLRequest Debug:
        --------------------------------
        🌍 URL: \(url?.absoluteString ?? "nil")
        🛑 Method: \(httpMethod ?? "nil")
        📋 Headers: \(allHTTPHeaderFields ?? [:])
        📦 Body: \(bodyString)
        --------------------------------
        """)
    }
}
