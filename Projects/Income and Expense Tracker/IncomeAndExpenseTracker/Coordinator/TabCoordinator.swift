//
//  HomeCoordinator.swift
//  Income and Expense Tracker
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import SwiftUI

class Coordinator<R: Hashable> : ObservableObject {

    @Published var path: [R] = []
    @Published var sheet: R?
    @Published var fullScreenCover: R?
    
    var sheetDismissHandler: () -> Void = {}
    var fullScreenDismissHandler: () -> Void = {}
    
    func push(_ pages: [R]) {
        path.append(contentsOf: pages)
    }
    
    func push(_ page: R) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func present(sheet: R, dismiss: (() -> Void)? = nil) {
        self.sheet = sheet
        self.sheetDismissHandler = dismiss ?? {}
    }
    
    func present(fullScreenCover: R, dismiss: (() -> Void)? = nil) {
        self.fullScreenCover = fullScreenCover
        self.fullScreenDismissHandler = dismiss ?? {}
    }
    
    func dismissSheet() {
        self.sheet = nil
        self.sheetDismissHandler()
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
        self.fullScreenDismissHandler()
    }
}

enum HomeRoute: String, Identifiable {
    case pages, test
    
    var id: String {
        self.rawValue
    }
}

enum StatisticsRoute: String, Identifiable {
    case pages, test
    
    var id: String {
        self.rawValue
    }
}

enum WalletRoute: String,Identifiable {
    case pages, test
    
    var id: String {
        self.rawValue
    }
}

enum ProfileRoute: String, Identifiable {
    case pages, test
    
    var id: String {
        self.rawValue
    }
}

typealias HomeCoordinator = Coordinator<HomeRoute>
typealias StatisticsCoordinator = Coordinator<StatisticsRoute>
typealias WalletCoordinator = Coordinator<WalletRoute>
typealias ProfileCoordinator = Coordinator<ProfileRoute>

