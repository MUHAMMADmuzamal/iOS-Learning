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
    let homeService: HomeServiceProtocol = HomeService(client: URLSession.shared)
    
    func finishLoading() {
        self.isLoading = false
    }
    
    func fetch() {
        subscriber = homeService.loadHomeData().sink { completion in
            print(completion)
        } receiveValue: { data in
            print("✅✅✅✅✅✅✅")
            print(data)
            print("✅✅✅✅✅✅✅")
        }
    }
}
