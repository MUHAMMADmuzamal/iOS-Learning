//
//  SignupVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation
import Combine

protocol SignupVMProtocol: ObservableObject {
    var userName: String { get set }
    var email: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    var phoneNumber: String { get set }
    var selectedCountry: CountryModel { get set }
    var isDisabledRegisterButton: Bool { get }

    func signup()
}

final class SignupVM: SignupVMProtocol {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var phoneNumber: String = ""
    @Published var selectedCountry: CountryModel = .defaultCountry
    
    var isDisabledRegisterButton: Bool {
        return userName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty || phoneNumber.isEmpty
    }
    
    var cancellable: Set<AnyCancellable> = []
    
    internal let router: SignupRouterProtocol
    private let useCase: SignupUseCaseProtocol
    private let logger: Logger
    
    init(router: SignupRouterProtocol, useCase: SignupUseCaseProtocol, logger: Logger) {
        self.router = router
        self.useCase = useCase
        self.logger = logger
    }
    
    func signup() {
        let model = SignupSendDTO(
            userName: self.userName,
            email: self.email,
            password: self.password,
            phoneNumber: self.phoneNumber,
            selectedCountry: self.selectedCountry.name)
        
        useCase.signup(model)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.logger.log("Signup error: \(error)", .error)
                }
            } receiveValue: { model in
                self.logger.log("Signup Success", .info)
            }.store(in: &cancellable)

    }
}
