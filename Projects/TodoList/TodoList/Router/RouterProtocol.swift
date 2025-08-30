//
//  RouterProtocol.swift
//  TodoList
//
//  Created by Muhammad Muzamal on 22/08/2025.
//

import Foundation
import SwiftUI

protocol RouterProtocol {
    var path:[RouterPath] {get set}
    
    func navigate(to destination: RouterPath)
    
    func navigateBack()
    
    func navigateBackToRoute()
    
    func navigateAndRemoveAll(to destination: RouterPath)
    
    func navigateAndReplaceCurrent(to destination: RouterPath)
    
    func navigateToRoot()
}

final class Router: RouterProtocol, ObservableObject {
    
    static let shared = Router()
    private init(){}
    
    @Published var path: [RouterPath] = []
//    var dictOfViews: [RouterPath: any View] = [
//        .createTask: CreateTask(),
//        .editTask(let id): CreateTask(editTaskId: id),
//        .home: HomeView()
//    ]
    
    func navigate(to destination: RouterPath) {
        path.append(destination)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateBackToRoute() {
        
    }
    
    func navigateAndRemoveAll(to destination: RouterPath) {
        path = [destination]
    }
    
    func navigateAndReplaceCurrent(to destination: RouterPath) {
        if !path.isEmpty {
            path.removeLast()
        }
        path.append(destination)
    }
    
    func navigateToRoot() {
        if !path.isEmpty {
            path = [path[0]]
        }
    }
}

enum RouterPath: Hashable {
    case home
    case createTask
    case editTask(UUID)

}
