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
    var headers: [String: String]? = nil
    var bodyParams: Data? = nil // getJsonData(for: someModel.dictionary)
    // getQueryItems(for: someModel.dictionary)
    // [URLQueryItem(name: "limit", value: model.limit), URLQueryItem(name: "counter", value: model.counter) ]
    var queryParams: [URLQueryItem]? = nil
}

class HomeURLRequestFactory {
    static func makeHomeURLRequest() -> Endpoint {
        return HomeEndpoint()
    }
}
