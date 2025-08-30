//
//  RemoteLogger.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation

final class RemoteLogger: Logger {
    private let wrapper: Logger
    private let logSender: LogSender
    
    init(wrapper: Logger, logSender: LogSender) {
        self.wrapper = wrapper
        self.logSender = logSender
    }
    
    func log(_ message: String, _ level: LogLevel) {
        wrapper.log(message, level)
        logSender.send(LogEntry(level: level, message: message))
    }
    
    func log(_ entry: LogEntry) {
        wrapper.log(entry)
        logSender.send(entry)
    }
}
