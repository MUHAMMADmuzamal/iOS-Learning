//
//  Income_and_Expense_TrackerApp.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI

@main
struct Income_and_Expense_TrackerApp: App {
    let injector = DependenciesHolder.shared.injector()
    var body: some Scene {
        WindowGroup {
            ContentView(injector: injector)
        }
    }
}
