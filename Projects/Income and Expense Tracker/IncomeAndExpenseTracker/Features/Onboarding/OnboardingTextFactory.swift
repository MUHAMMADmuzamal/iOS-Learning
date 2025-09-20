//
//  OnboardingTextFactory.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 16/09/2025.
//

import SwiftUI

struct OnboardingTextFactory {
    static func makeLoginPrompt() -> AttributedString {
        var attributedString = AttributedString("Already have account? Log In")
        attributedString.foregroundColor = .graphite
        if let range = attributedString.range(of: "Log In") {
            attributedString[range].foregroundColor = .deepTeal
            attributedString[range].font = .inter(size: 14, weight: .regular)
        }
        return attributedString
    }
}
