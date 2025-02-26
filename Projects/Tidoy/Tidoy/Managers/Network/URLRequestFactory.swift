//
//  URLRequestFactory.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 25/02/2025.
//

import Foundation

struct HomeURLResolver: URLRequestProtocol {
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var headers: [String : String]?
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
    
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
    
    init(baseURL: String, path: String, method: HTTPMethod, headers: [String : String]? = nil, bodyParams: Data? = nil, queryParams: [URLQueryItem]? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.bodyParams = bodyParams
        self.queryParams = queryParams
    }
    
    init() { //  pass some model
        self.baseURL = "https://dummyjson.com/"
        self.path = "c/9c21-3664-49d1-ab17"
        self.method = .GET
        self.headers = nil
        self.bodyParams = nil // getJsonData(for: someModel.dictionary)
        
        // getQueryItems(for: someModel.dictionary)
        // [URLQueryItem(name: "limit", value: model.limit), URLQueryItem(name: "counter", value: model.counter) ]
        self.queryParams = nil
        
    }
}
protocol HomeURLRequestFactoryProtocol {
    func makeHomeURLRequest() -> URLRequestProtocol
}

class HomeURLRequestFactory: HomeURLRequestFactoryProtocol {
    func makeHomeURLRequest() -> URLRequestProtocol {
        return HomeURLResolver()
    }
}

class URLRequestAbstractFactory {
    static func getHomeFactory() -> HomeURLRequestFactoryProtocol {
        return HomeURLRequestFactory()
    }
}
