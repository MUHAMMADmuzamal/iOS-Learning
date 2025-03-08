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

final class HomeVM: HomeVMProtocol {
    internal let router: HomeRouterProtocol
    private let useCase: HomeUseCaseProtocol
    private let logger: Logger
    private var cancellables = Set<AnyCancellable>()
    
    var appError: AppError?
    @Published var isPresentError: Bool = false
    
    init(router: HomeRouterProtocol, useCase: HomeUseCaseProtocol, logger: Logger) {
        self.router = router
        self.useCase = useCase
        self.logger = logger
    }
    
    func fetchData() {
        useCase.loadHomeData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
                //            if case .failure(let error) = completion {
                //                print((error as? APIError)?.title)
                //            }
                
                switch completion {
                case let .failure(errorResponse):
                    self.appError = errorResponse
                    self.isPresentError = true
                    self.logger.log(errorResponse.message, .error)
                case .finished:
                    break
                }
            } receiveValue: { _ in
                self.logger.log("Data fetched", .info)
            }.store(in: &cancellables)
    }
}
