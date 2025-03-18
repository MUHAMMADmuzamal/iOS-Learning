//
//  SignupEndPointsFactory.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 17/03/2025.
//

import Foundation
struct SignupEndpoint: WithOutAuthTokenEndpoint {
    var baseURL: String = .baseURL
    var path: String = "/signup"
    var method: HTTPMethod = .POST
    var headers: [String: String]?
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
}

final class SignupURLRequestFactory {
    static func makeSignupURLRequest(_ model: SignupSendDTO) throws -> Endpoint {
        return SignupEndpoint(bodyParams: try model.encode())
    }
}
