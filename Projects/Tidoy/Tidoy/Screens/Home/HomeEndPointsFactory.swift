//
//  URLRequestFactory.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

struct HomeEndpoint: Endpoint {
    var baseURL: String = "https://dummyjson.com/"
    var path: String = "c/9c21-3664-49d1-ab17"
    var method: HTTPMethod = .GET
    var headers: [String: String]?
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
}

class HomeURLRequestFactory {
    static func makeHomeURLRequest() -> Endpoint {
        return HomeEndpoint()
    }
    
    static func makeExampleURLRequest() -> Endpoint {
        return ExampleEndpoint(ExampleDTO(name: "ali"))
    }
}

struct ExampleDTO: Encodable {
    let name: String
}

struct ExampleEndpoint: Endpoint {
    var baseURL: String = .baseURL
    var path: String = "api/users/"
    var method: HTTPMethod = .POST
    var headers: [String: String]?
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
    init(_ model: ExampleDTO) {
        // [URLQueryItem(name: "limit", value: model.limit)]
        queryParams = try? model.toQueryItems()
        bodyParams = try? model.encode()
    }
}
