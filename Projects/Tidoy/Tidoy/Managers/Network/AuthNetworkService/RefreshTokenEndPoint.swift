//
//  RefreshTokenEndPoint.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 08/03/2025.
//

import Foundation

struct RefreshTokenEndpoint: Endpoint {
    var baseURL: String = .baseURL
    
    var method: HTTPMethod = .POST
    
    var headers: [String: String]? = ["Content-type": "application/json"]
    
    var bodyParams: Data?
    
    var queryParams: [URLQueryItem]?
    
    var path: String = "/refresh-token"
    
    var request: URLRequest {
        var urlComponents: URLComponents = URLComponents(string: baseURL + path)! // base URL + path
        urlComponents.queryItems = queryParams
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method.rawValue
        request.httpBody = bodyParams
        self.headers?.forEach({ (key: String, value: String) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        request.timeoutInterval = 10
        
        request.log() // Only Print to terminal
        
        return request
    }
}
