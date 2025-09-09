//
//  Splash.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 09/09/2025.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            LinearGradient.tealToDarkTeal
                .ignoresSafeArea(.all)
            Text("mono")
                .font(.inter(size: 50, weight: .bold))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    Splash()
}
