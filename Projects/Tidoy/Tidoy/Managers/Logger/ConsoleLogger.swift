//
//  Logger.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation

final class ConsoleLogger: Logger {
    
    private let logPrefixes: [LogLevel: String] = [
        .verbose: "💜 VERBOSE -", /// Not so important 💜
        .debug: "💚 DEBUG -", /// Something to debug 💚
        .info: "ℹ️ INFO -", /// Good to know ℹ️
        .warning: "⚠️ WARNING -", /// Something bad happened ⚠️
        .error: "⛔️ ERROR -" /// ERROR!!!! ⛔️
    ]

    func log(_ message: String, _ level: LogLevel) {
        let prefix = logPrefixes[level] ?? ""
        print(prefix, message)
    }
}
