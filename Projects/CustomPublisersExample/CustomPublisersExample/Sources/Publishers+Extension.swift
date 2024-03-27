//
//  Publishers+Extension.swift
//  CustomPublisersExample
//
//  Created by Codes Orbit on 27/03/2024.
//

import Foundation
import Combine

// MARK: Publisher
extension Publishers {
    struct DataPublisher: Publisher {
        
        typealias Output = Data
        
        typealias Failure = Error
        
        private let urlRequest: URLRequest
        
        init(urlRequest: URLRequest) {
            self.urlRequest = urlRequest
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, DataPublisher.Failure == S.Failure, DataPublisher.Output == S.Input {
            let subscription = DataSubscription(request: urlRequest, subscriber: subscriber)
            subscriber.receive(subscription: subscription)
        }
    }
}

//MARK: Subscription
extension Publishers {
    class DataSubscription<S: Subscriber>: Subscription where S.Input == Data, S.Failure == Error {
        
        private let session = URLSession.shared
        private let request: URLRequest
        private var subscriber: S?
        
        init(request: URLRequest, subscriber: S) {
            self.request = request
            self.subscriber = subscriber
            self.sendRequest()
        }
        
        func request(_ demand: Subscribers.Demand) {
            
        }
        
        func cancel() {
            subscriber = nil
        }
        
        private func sendRequest(){
            guard let subscriber = subscriber else { return }
            session.dataTask(with: self.request) { data, _, error in
                _ = data.map(subscriber.receive)
                _ = error.map({subscriber.receive(completion: Subscribers.Completion.failure($0))})
            }.resume()
        }
    }
}
