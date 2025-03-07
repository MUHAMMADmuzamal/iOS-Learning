//
//  LoginEndPointsFactory.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
struct LoginEndpoint: Endpoint {
    var baseURL: String = .baseURL
    var path: String = "/login"
    var method: HTTPMethod = .POST
    var headers: [String: String]?
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
}

final class LoginURLRequestFactory {
    static func makeLoginURLRequest(_ data: Data?) -> Endpoint {
        return LoginEndpoint(bodyParams: data )
    }
}
