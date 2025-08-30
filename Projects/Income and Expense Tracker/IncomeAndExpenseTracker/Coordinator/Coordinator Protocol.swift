//
//  Coordinator Protocol.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI

//protocol Coordinator: ObservableObject {
//    
//    associatedtype Content: View
//    
//    var path: [HomePage] { get } // here navigation path or this is good or any hashable
//    var sheet: HomeSheet? { get } // how define it @publiesd
//    var fullScreenCover: HomeFullScreenCover? { get }
//    
//    func push(_ page: HomePage)
//    func pop()
//    func popToRoot()
//    
//    func present(sheet: HomeSheet)
//    func present(fullScreenCover: HomeFullScreenCover)
//    
//    func dismissSheet()
//    func dismissFullScreenCover()
//    
//    func build(page: HomePage) -> Content
//    func build(sheet: HomeSheet) -> Content
//    func build(page: HomeFullScreenCover) -> Content
//}


class HomeCoordinator: ObservableObject {
    
    @Published var path: [HomePage] = []
    @Published var sheet: HomeSheet?
    @Published var fullScreenCover: HomeFullScreenCover?
    
    func push(_ page: HomePage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func present(sheet: HomeSheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: HomeFullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: HomePage) -> some View {
        switch page {
        case .notifications:
            Text("Notifications")
        }
    }
    
    @ViewBuilder
    func build(sheet: HomeSheet) -> some View {
        switch sheet {
        case .addExpense:
            Text("addExpense")
        }
    }
    
    @ViewBuilder
    func build(fullScreen: HomeFullScreenCover) -> some View {
        switch fullScreen {
        case .calendar:
            Text("Calenedar")
        }
    }
}

enum HomePage: String, Identifiable {
    case notifications
    
    var id: String {
        self.rawValue
    }
}

enum HomeSheet: String, Identifiable {
    case addExpense
    
    var id: String {
        self.rawValue
    }
}

enum HomeFullScreenCover: String, Identifiable {
    case calendar
    
    var id: String {
        self.rawValue
    }
}
