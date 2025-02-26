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
    let service: HomeServiceProtocol
    var subscriber: AnyCancellable?
    
    init(router: HomeRouterProtocol, service: HomeServiceProtocol) {
        self.router = router
        self.service = service
    }
    
    func fetchData() {
        subscriber = service.loadHomeData().sink { completion in
            print(completion)
        } receiveValue: { data in
            print("✅✅✅✅✅✅✅")
            print(data)
            print("✅✅✅✅✅✅✅")
        }
    }
}
