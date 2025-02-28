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
    var appError: AppError? { get }
    
    func fetchData()
}

class HomeVM: HomeVMProtocol, ObservableObject {
    let router: HomeRouterProtocol
    let useCase: HomeUseCaseProtocol
    var subscriber: AnyCancellable?
    
    @Published var appError: AppError?
    
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
                guard let error = errorResponse as? AppError else { return }
                self.appError = error
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
