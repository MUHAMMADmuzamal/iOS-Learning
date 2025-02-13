//
//  RootVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/02/2025.
//

import Foundation
import Swinject

protocol RootVMProtocol {
    var isLoading: Bool { get set }
}

class RootVM: RootVMProtocol, ObservableObject {
    
    let injector: Container
    
    @Published var coordinator: AppCoordinatorProtocol
    @Published var isLoading: Bool = true
    @Published var hasCompletedOnboarding: Bool = false
    @Published var displaySignup: Bool = true
    
    init(injector: Container) {
        self.injector = injector
        self.coordinator = injector.resolve(AppCoordinatorProtocol.self)!
    }
}
