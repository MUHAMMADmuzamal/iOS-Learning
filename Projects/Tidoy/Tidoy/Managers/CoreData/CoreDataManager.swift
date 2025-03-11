//
//  CoreDataManager.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 11/03/2025.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
//    static let shared = CoreDataManager()
    
    let persistentContainer = NSPersistentContainer(name: "MyDatabase")
    
     init() {
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Apply changes successfully!")
            } catch {
                print("Failed to apply.: \(error)")
            }
        }
    }
}
