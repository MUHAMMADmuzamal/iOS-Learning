//
//  ProfileFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import SwiftUI

final class ProfileFactory {
    static func make() -> some View {
        VStack {
            Text("Profile")
        }
        .navigationDestination(for: ProfileRoute.self) { route in
            Text(route.rawValue)
        }
    }
}
