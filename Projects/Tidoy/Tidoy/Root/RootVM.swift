//
//  RootVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/02/2025.
//

import Foundation
import Combine

final class RootVM: ObservableObject {
    
    @Published var isLoading: Bool = true
    @Published var hasCompletedOnboarding: Bool = true
    var coordinator: AppCoordinator
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        binding()
    }
    
    func finishLoading() {
        self.isLoading = false
    }
    
    func binding() {
        TokenStorage.$accessToken.sink {[weak self] accessToken in
            self?.coordinator.isLoggedIn = !(accessToken?.isEmpty ?? true)
        }.store(in: &cancellables)
        
        TokenStorage.$refreshToken.sink {[weak self] refreshToken in
            self?.coordinator.isLoggedIn = !(refreshToken?.isEmpty ?? true)
        }.store(in: &cancellables)
        let navigateToLogin = TokenStorage.accessToken?.isEmpty ?? true || TokenStorage.refreshToken?.isEmpty ?? true
        self.coordinator.isLoggedIn = !navigateToLogin
    }
}
