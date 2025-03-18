//
//  RootVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/02/2025.
//

import Foundation
import Combine

class RootVM: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var hasCompletedOnboarding: Bool = true
    
    func finishLoading() {
        self.isLoading = false
    }
}
