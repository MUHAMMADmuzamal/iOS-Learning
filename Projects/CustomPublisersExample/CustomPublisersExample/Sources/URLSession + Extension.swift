//
//  URLSession + Extension.swift
//  CustomPublisersExample
//
//  Created by Codes Orbit on 27/03/2024.
//

import Foundation
import Combine

extension URLSession {
    func dataResponse(for request: URLRequest) -> Publishers.DataPublisher {
        Publishers.DataPublisher(urlRequest: request)
    }
}
