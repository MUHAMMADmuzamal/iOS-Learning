//
//  CoreDataService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 11/03/2025.
//

import Foundation
import CoreData

class CoreDataService {
    private let manager = CoreDataManager()
    
    func addUser(_ model: LoginSendDTO) {
        let newUser = Users(context: manager.context)
        newUser.email = model.email
        newUser.password = model.password
        manager.saveContext()
    }
    
    func updateUser(_ model: Users, _ newModel: LoginSendDTO) {
        model.email = newModel.email
        model.password = newModel.password
        manager.saveContext()
    }
    
    func getAllUsers() -> [Users] {
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()
        do {
            return try manager.context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch users: \(error)")
            return []
        }
    }
    
    func deleteUser(user: Users) {
        
        manager.context.delete(user)

        manager.saveContext()
    }
}
