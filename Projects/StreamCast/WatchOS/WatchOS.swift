//
//  WatchOS.swift
//  WatchOS
//
//  Created by Codes Orbit on 13/05/2024.
//

import AppIntents

struct WatchOS: AppIntent {
    static var title: LocalizedStringResource = "WatchOS"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
