//
//  CoreDataService.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 11/03/2025.
//

import Foundation
import CoreData
import Combine

class HomeCoreDataRepository: HomeRepositoryProtocol {

    private let manager = CoreDataManager.shared
    
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
    
    func fetchHomeData() -> AnyPublisher<HomeResponseDTO, AppError> {
        let users = getAllUsers()
        for user in users {
            print(user.email ?? "Unknown")
        }
        let homeData = HomeResponseDTO(users: UsersContainer(data: users.map({User(email: $0.email ?? "Unknown", username: $0.password ?? "No password", role: "no role")})))
        return Just(homeData)
            .setFailureType(to: AppError.self)
            .eraseToAnyPublisher()
    }
}
