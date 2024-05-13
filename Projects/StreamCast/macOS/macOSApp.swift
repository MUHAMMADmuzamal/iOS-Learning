//
//  macOSApp.swift
//  macOS
//
//  Created by Codes Orbit on 13/05/2024.
//

import SwiftUI

@main
struct macOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
