//
//  HTTPRequest.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

protocol URLRequestProtocol {

    var baseURL: String { get }
    var path: String { get }
    var request: URLRequest { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    var queryParams: [URLQueryItem]? { get }
    var bodyParams: Data? { get }
}

extension URLRequestProtocol {
    func getQueryItems(for dictionary: [String: Any]) -> [URLQueryItem] {
        return dictionary.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
    
    func getJsonData(for dictionary: [String: Any]) -> Data? {
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        return jsonData
    }
    
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
        return request
    }
}
