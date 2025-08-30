//
//  Logger.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation

struct LogEntry: Encodable {
    let level: LogLevel
    let message: String
    let timestamp: TimeInterval = Date().timeIntervalSince1970
    let context: [String: Any]?  // Optional additional data
    
    enum CodingKeys: String, CodingKey {
        case level, message, timestamp, context
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(level, forKey: .level)
        try container.encode(message, forKey: .message)
        try container.encode(timestamp, forKey: .timestamp)

        if let context = context {
            let encodedContext = try JSONSerialization.data(withJSONObject: context, options: [])
            let jsonString = String(data: encodedContext, encoding: .utf8)
            try container.encode(jsonString, forKey: .context) // Encode as a JSON String
        }
    }
    
    init(level: LogLevel, message: String, context: [String : Any]? = nil) {
        self.level = level
        self.message = message
        self.context = context
    }
}

protocol Logger {
    func log(_ entry: LogEntry)
    func log(_ message: String, _ level: LogLevel)
}

enum LogLevel: String, Encodable {
    case verbose
    case debug
    case info
    case warning
    case error
}
