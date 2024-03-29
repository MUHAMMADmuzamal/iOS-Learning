//
//  CombineNetworkProvider.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 28/03/2024.
//

import Foundation
import Combine

class CombineNetworkProvider {
    private let session = URLSession.shared
    private let networkMonitoringService: NetworkMonitoringService
    
    init(networkMonitoringService: NetworkMonitoringService) {
        self.networkMonitoringService = networkMonitoringService
    }
    
    func request<T: Decodable>(_ api: APITarget) -> AnyPublisher<T, Error> {
        return session.dataTaskPublisher(for: api.request)
            .mapError { _ in
                guard self.networkMonitoringService.isNetworkAvailable else {
                    return NSError(domain:"network", code: 15)
                }
                
                return NSError(domain: "Error", code: 11)
            }
            .flatMap { data, response -> AnyPublisher<T, Error> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NSError(domain:"error", code: 12)).eraseToAnyPublisher()
                }
                
                if 200 ..< 300 ~= httpResponse.statusCode {
                    return self.parseJson(data, ofType: T.self)
                } else {
                    return self.parseJson(data, ofType: T.self)
                }
            }
            .eraseToAnyPublisher()
        
    }
    func handleClientError(_ error: Error?) {

    }
    func handleServerError(_ response: URLResponse?) -> AnyPublisher<Void, Error> {
        let error = NSError(domain: "HTTP", code: (response as? HTTPURLResponse)?.statusCode ?? -1, userInfo: nil)
        return .fail(error)
    }
    func parseJson<T: Decodable> (_ jsonData: Data, ofType type: T.Type) -> AnyPublisher<T, Error> {
        do {
            let decodedData: T = try JSONDecoder().decode(type, from: jsonData)
            return .just(decodedData)
        }catch {
            return Fail(error: NSError(domain:"error", code: 13)).eraseToAnyPublisher()
        }
    }
}
