//
//  LoggerEndPoint.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation

struct LoggerEndPoint: Endpoint {
    var baseURL: String = .baseURL
    
    var path: String = "/log"
    
    var method: HTTPMethod = .POST
    
    var headers: [String : String]?
    
    var bodyParams: Data?
    
    var queryParams: [URLQueryItem]?
    
}
