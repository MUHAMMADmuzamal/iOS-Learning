//
//  URLRequestFactory.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

struct HomeEndpoint: Endpoint {
    var baseURL: String = .baseURL
    var path: String = "/users"
    var method: HTTPMethod = .GET
    var headers: [String: String]?
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
}

final class HomeURLRequestFactory {
    static func makeHomeURLRequest() -> Endpoint {
        return HomeEndpoint()
    }
}

//struct ExampleDTO: Encodable {
//    let username: String
//    let password: String
//}
//
//struct ExampleEndpoint: Endpoint {
//    var baseURL: String = .baseURL
//    var path: String = "/users"
//    var method: HTTPMethod = .GET
//    var headers: [String: String]?
//    var bodyParams: Data?
//    var queryParams: [URLQueryItem]?
//    init(_ model: ExampleDTO) {
//        // [URLQueryItem(name: "limit", value: model.limit)]
////        queryParams = try? model.toQueryItems()
////        bodyParams = try? model.encode()
//    }
//}
