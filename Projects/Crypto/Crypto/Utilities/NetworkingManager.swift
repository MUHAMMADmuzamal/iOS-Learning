//
//  NetworkingManager.swift
//  Crypto
//
//  Created by Codes Orbit on 15/09/2024.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case let .badURLResponse(url):
                return "[🔥] Bad response from URL \(url)"
            case .unknown:
                return "[⚠️] Unknown error occurred"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error>
    {
       return URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default)) // data task already on background thread
            .tryMap({try handleURLResponse(output: $0, url: url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error> )  {
        switch completion {
            
        case .finished:
            break
        case let .failure(error):
            debugPrint(error.localizedDescription)
        }
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response =  output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
}
