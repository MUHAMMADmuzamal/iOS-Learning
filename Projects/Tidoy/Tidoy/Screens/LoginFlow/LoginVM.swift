//
//  LoginVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Combine

protocol LoginVMProtocol: ObservableObject {
    var appError: AppError? { get set }
    var isPresentError: Bool { get set }
    
    func login(email: String, password: String)
}

final class LoginVM: LoginVMProtocol {
    private let router: LoginRouterProtocol
    private let useCase: LoginUseCaseProtocol
    private let logger: Logger
    private var subscriber: AnyCancellable?
    
    var appError: AppError?
    @Published var isPresentError: Bool = false
    
    init(useCase: LoginUseCaseProtocol,
         router: LoginRouterProtocol,
         logger: Logger) {
        self.useCase = useCase
        self.router = router
        self.logger = logger
    }
    
    func login(email: String, password: String)  {
        subscriber = useCase.login(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
            switch completion {
            case let .failure(errorResponse):
                self.appError = errorResponse
                self.isPresentError = true
                self.logger.log(errorResponse.message, .error)
            case .finished:
                break
            }
        } receiveValue: { data in
            print(data)
            TokenStorage.accessToken = data.accessToken
            TokenStorage.refreshToken = data.refreshToken
            self.logger.log("Login Success", .info)
            self.router.navigateToHome()
        }
    }
}
