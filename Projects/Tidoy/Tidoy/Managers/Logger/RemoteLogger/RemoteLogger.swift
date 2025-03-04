//
//  RemoteLogger.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 03/03/2025.
//

import Foundation
import Combine

struct RemoteLogDTO: Encodable {
    let level: String
    let message: String
    let timestamp = Date().timeIntervalSince1970
}

final class RemoteLogger: Logger {
    private let wrapper: Logger
    private let httpClient: HTTPClient
    private let logEndpoint: Endpoint
    private var cancelable: AnyCancellable?
    
    init(wrapper: Logger, httpClient: HTTPClient, logEndpoint: Endpoint) {
        self.wrapper = wrapper
        self.httpClient = httpClient
        self.logEndpoint = logEndpoint
    }
    
    func log(_ message: String, _ level: LogLevel) {
        wrapper.log(message, level)
        sendLogToServer(message, level)
        
    }
    
    private func sendLogToServer(_ message: String, _ level: LogLevel) {
        
        let logData = RemoteLogDTO(level: level.rawValue, message: message)
        
        self.cancelable =  httpClient.performRequest(self.logEndpoint)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("❌ Remote Logging Failed:", error)
                }
            }, receiveValue: { _ in })
    }
}
