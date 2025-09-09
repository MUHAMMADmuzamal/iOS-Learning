//
//  HomeRoute.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import Foundation

enum HomeRoute: String, Identifiable {
    case pages, test
    
    var id: String {
        self.rawValue
    }
}
