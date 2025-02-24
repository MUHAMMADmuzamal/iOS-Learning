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
    @Published var displaySignup: Bool = true
    var subscriber: AnyCancellable?
    let networkManager: NetworkService = NetworkService()
    
    func finishLoading() {
        self.isLoading = false
    }
    
    func fetch() {
        subscriber = networkManager.request().sink { completion in
            print(completion)
        } receiveValue: { response in
            print(response)
        }

    }
}
