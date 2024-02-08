//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Codes Orbit on 08/02/2024.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
