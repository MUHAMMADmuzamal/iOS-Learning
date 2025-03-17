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
    
    var loginMethod: LoginMethod { get set }
    var phoneNumberFieldText: String { get set }
    var emailFieldText: String { get set }
    var passwordFieldText: String { get set }
    
    func login()
}

final class LoginVM: LoginVMProtocol {
    
    @Published var loginMethod: LoginMethod = .phoneNumber
    @Published var phoneNumberFieldText: String = ""
    @Published var emailFieldText: String = ""
    @Published var passwordFieldText: String = ""
    
    private let router: LoginRouterProtocol
    private let useCase: LoginUseCaseProtocol
    private let logger: Logger
    private var cancellables = Set<AnyCancellable>()
    
    var appError: AppError?
    @Published var isPresentError: Bool = false
    
    init(useCase: LoginUseCaseProtocol,
         router: LoginRouterProtocol,
         logger: Logger) {
        self.useCase = useCase
        self.router = router
        self.logger = logger
    }
    
    func login() {
        useCase.login(email: self.emailFieldText, password: self.passwordFieldText)
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
        }.store(in: &cancellables)
    }
}
