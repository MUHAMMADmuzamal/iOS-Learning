//
//  FetchRequestCoreDataApp.swift
//  FetchRequestCoreData
//
//  Created by Muhammad Muzamal on 29/08/2025.
//

import SwiftUI

@main
struct FetchRequestCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
