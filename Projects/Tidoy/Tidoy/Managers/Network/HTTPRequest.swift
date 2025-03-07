//
//  HTTPRequest.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var bodyParams: Data? { get }
    var queryParams: [URLQueryItem]? { get }
}

extension Endpoint {
    
    var request: URLRequest {
        var urlComponents: URLComponents = URLComponents(string: baseURL + path)! // base URL + path
        urlComponents.queryItems = queryParams
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method.rawValue
        request.httpBody = bodyParams
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        let token = TokenStorage.accessToken ?? ""
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        self.headers?.forEach({ (key: String, value: String) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        request.timeoutInterval = 10
        
        request.log() // Only Print to terminal
        
        return request
    }
}
