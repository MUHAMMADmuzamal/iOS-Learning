//
//  HomeVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation
import Combine

protocol HomeVMProtocol {
    var router: HomeRouterProtocol { get } 
    
    func fetchData()
}

class HomeVM: HomeVMProtocol, ObservableObject {
    let router: HomeRouterProtocol
    let useCase: HomeUseCaseProtocol
    var subscriber: AnyCancellable?
    
    init(router: HomeRouterProtocol, useCase: HomeUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }
    
    func fetchData() {
        subscriber = useCase.loadHomeData().sink { completion in
            
            if case .failure(let error) = completion {
                print((error as? APIError)?.title)
            }
        } receiveValue: { data in
            print("✅✅✅✅✅✅✅")
            print(data)
            print("✅✅✅✅✅✅✅")
        }
    }
}
