//
//  OnboardingView.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 16/09/2025.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            ZStack {
                Image(.onboardingBackground)
                Image(.onboardingMen)
                    .padding(.top, 126)
            }
            
            Text("Spend Smarter \nSave More")
                .font(.inter(size: 36, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundStyle(.deepTeal)
            
            Button("Get Started", action: {})
                .buttonStyle(ShadowButtonStyle())
                .frame(height: 67)
                .padding(.horizontal, 28)
            
            Text(OnboardingTextFactory.makeLoginPrompt())
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
