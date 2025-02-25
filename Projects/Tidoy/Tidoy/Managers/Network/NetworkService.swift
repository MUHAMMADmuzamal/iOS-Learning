//
//  NetworkProvider.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/02/2025.
//

import Foundation
import Combine

struct ServerError: Error {
    let title: String
    let description: String?
}

// MARK: - UserElement
struct UserElement: Codable {
    let createdAt, name: String?
    let avatar: String?
    let accessToken, refreshToken, id: String?
}

protocol HTTPClient {
    func performRequest(_ request: URLRequest) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error>
}

extension URLSession: HTTPClient {
    struct InValidHTTPResponseError: Error {}
    
    func performRequest(_ request: URLRequest) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        let session = URLSession.shared
        return session.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw InValidHTTPResponseError()
                }
                return (data, response)
            }.eraseToAnyPublisher()
    }
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}

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

class URLRequestFactory {
    static func makeHomeURLRequest() -> URLRequestProtocol {
        return HomeURLResolver()
    }
}

protocol HomeServiceProtocol {
    func loadHomeData() -> AnyPublisher<[UserElement], Error>
}

class HomeService: HomeServiceProtocol {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    
    
    func loadHomeData() -> AnyPublisher<[UserElement], Error> {
        return client.performRequest(URLRequestFactory.makeHomeURLRequest().request)
            .tryMap(HomeMapper.map)
            .eraseToAnyPublisher()
    }
}

class HomeMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [UserElement] {
        if response.statusCode == 200 {
            return try JSONDecoder().decode([UserElement].self, from: data)
        }
        return []
    }
}
