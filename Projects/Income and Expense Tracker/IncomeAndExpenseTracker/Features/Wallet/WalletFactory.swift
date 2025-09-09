//
//  WalletFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 05/09/2025.
//

import SwiftUI

final class WalletFactory {
    static func make() -> some View {
        VStack {
            Text("Wallet")
        }
        .navigationDestination(for: WalletRoute.self) { route in
            Text(route.rawValue)
        }
    }
}

