//
//  RootVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/02/2025.
//

import Foundation
class RootVM: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var hasCompletedOnboarding: Bool = false
    @Published var displaySignup: Bool = true
    
    func finishLoading() {
        self.isLoading = false
    }
}
