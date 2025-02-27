//
//  NetworkProvider.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/02/2025.
//

import Foundation
import Combine

protocol HTTPClient {
    func performRequest(_ request: URLRequestProtocol) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error>
}

extension URLSession: HTTPClient {
    struct InValidHTTPResponseError: Error {}
    
    func performRequest(_ request: URLRequestProtocol) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        let session = URLSession.shared
        return session.dataTaskPublisher(for: request.request)
            .tryMap { (data: Data, response: URLResponse) in
                guard let response = response as? HTTPURLResponse else {
                    throw InValidHTTPResponseError()
                }
                return (data, response)
            }.eraseToAnyPublisher()
    }
}

// MARK: For testing.
class HTTPMockClient: HTTPClient {
    var data: Data
    var response: HTTPURLResponse
    var error: Error?

    init(data: Data, response: HTTPURLResponse, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func performRequest(_ request: URLRequestProtocol) -> AnyPublisher<(data: Data, response: HTTPURLResponse), Error> {
        
        if let error = self.error {
            return Fail(error: error).eraseToAnyPublisher()
        }else {
            return Just((data:self.data, response: self.response))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}

func successResponse() -> HTTPMockClient {
    let jsonData = """
            [{
                "createdAt": "2023-12-12",
                "name": "John Doe",
                "avatar": "https://example.com/avatar.png",
                "accessToken": "abc123",
                "refreshToken": "xyz789",
                "id": "1"
            }]
            """.data(using: .utf8)!
    
    let mockResponse = HTTPURLResponse(url: URL(string: "https://dummyjson.com")!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)!
    return HTTPMockClient(data: jsonData, response: mockResponse)
}

func failureResponse() -> HTTPMockClient {
    let jsonData = """
            {
                "status": 401,
                "error": "Unauthorized",
                "message": "Invalid token. Please log in again.",
                "details": null
            }

            """.data(using: .utf8)!
    
    let mockResponse = HTTPURLResponse(url: URL(string: "https://dummyjson.com")!,
                                       statusCode: 401,
                                       httpVersion: nil,
                                       headerFields: nil)!
    return HTTPMockClient(data: jsonData, response: mockResponse)
}
