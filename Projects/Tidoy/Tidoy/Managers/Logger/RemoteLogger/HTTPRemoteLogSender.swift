//
//  RemoteLogSender.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 04/03/2025.
//

import Foundation
import Combine

final class HttpRemoteLogSender: LogSender {
    private let httpClient: HTTPClient
    private var cancelable: AnyCancellable?

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func send(_ entry: LogEntry) {
        guard let model = try? entry.encode() else { return }
        let endpoint = LoggerEndpointFactory.createEndpoint(body: model)

        cancelable = httpClient.performRequest(endpoint)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("❌ Remote Logging Failed:", error)
                }
            }, receiveValue: { _ in })
    }
}
