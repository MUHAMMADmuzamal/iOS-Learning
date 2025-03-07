//
//  LoggerEndPoint.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation

struct LoggerEndPoint: Endpoint {
    var baseURL: String
    
    var path: String
    
    var method: HTTPMethod
    
    var headers: [String: String]?
    
    var bodyParams: Data?
    
    var queryParams: [URLQueryItem]?
    
}


struct LoggerEndpointFactory {
    static func createEndpoint(body: Data) -> Endpoint {
        return LoggerEndPoint(baseURL: .baseURL, path: "/log", method: .POST, bodyParams: body)
    }
}
