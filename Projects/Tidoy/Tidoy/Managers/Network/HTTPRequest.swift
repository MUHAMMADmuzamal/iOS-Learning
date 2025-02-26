//
//  HTTPRequest.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

protocol URLRequestProtocol {
    /**
     Base url for your API.
     - Example: https://yourappiAddress
     */
    var baseURL: String { get }
    
    /**
     Detailed path for your end point.
     - Example: /your path
     */
    var path: String { get }
    
    /**
     Request body should generated automaticly based on another params
     */
    var request: URLRequest { get }
    
    /**
     Headers for your request. Place authorization and language settings here
     */
    var headers: [String: String]? { get }
    /**
     HTTP method for your request. Look into HTTPMethod enum for details
     */
    var method: HTTPMethod { get }
    
    /**
     Additional Query params for your request. If your endpoint doesn't need any params, just add empty array, during genration of request param it should ignore this field.
     */
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
}
