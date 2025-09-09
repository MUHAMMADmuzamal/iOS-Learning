//
//  StatisticsFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import SwiftUI

final class StatisticsFactory {
    static func make() -> some View {
        VStack {
            Text("Statistics")
        }
        .navigationDestination(for: StatisticsRoute.self) { route in
            Text(route.rawValue)
        }
    }
}
