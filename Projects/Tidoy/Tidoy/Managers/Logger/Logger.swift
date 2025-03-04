//
//  Logger.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation

protocol Logger {
    func log(_ message: String, _ level: LogLevel)
}

enum LogLevel: String {
    case verbose
    case debug
    case info
    case warning
    case error
}
