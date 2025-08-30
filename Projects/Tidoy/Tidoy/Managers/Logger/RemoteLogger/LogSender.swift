//
//  LogSender.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 04/03/2025.
//

import Foundation

protocol LogSender {
    func send(_ entry: LogEntry)
}

