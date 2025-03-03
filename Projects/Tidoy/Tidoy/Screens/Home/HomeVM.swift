//
//  HomeVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation
import Combine

protocol HomeVMProtocol: ObservableObject {
    var router: HomeRouterProtocol { get } 
    var appError: AppError? { get set }
    var isPresentError: Bool { get set }
    
    func fetchData()
}

class HomeVM: HomeVMProtocol {
    let router: HomeRouterProtocol
    let useCase: HomeUseCaseProtocol
    var subscriber: AnyCancellable?
    
    var appError: AppError?
    @Published var isPresentError: Bool = false
    
    init(router: HomeRouterProtocol, useCase: HomeUseCaseProtocol) {
        self.router = router
        self.useCase = useCase
    }
    
    func fetchData() {
        subscriber = useCase.loadHomeData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
            
//            if case .failure(let error) = completion {
//                print((error as? APIError)?.title)
//            }

            switch completion {
            case let .failure(errorResponse):
                self.appError = errorResponse
                self.isPresentError = true
            case .finished:
                break
            }
        } receiveValue: { data in
            print("✅✅✅✅✅✅✅")
            print(data)
            print("✅✅✅✅✅✅✅")
        }
    }
}
