//
//  AsyncNetworkProvider.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 21/03/2024.
//

import Foundation
class AsyncNetworkProvider {
    private let session = URLSession.shared
    func request<T: Decodable>(_ api: APITarget) async -> Result<T, Error> {
        do{
            let response =  try await session.data(for: api.request)
            guard let response = response as? (Data, HTTPURLResponse),
                  (200...299).contains(response.1.statusCode) else {
                return .failure(self.handleServerError(response.1))
            }
            guard !response.0.isEmpty else {
                let error = NSError(domain: "Data", code: -1, userInfo: nil)
                return .failure(error)
            }

            return self.parseJson(response.0, ofType: T.self)
        }catch{
            return .failure(error)
        }
    }
    func handleClientError(_ error: Error?) {

    }
    func handleServerError(_ response: URLResponse?) -> Error {
        let error = NSError(domain: "HTTP", code: (response as? HTTPURLResponse)?.statusCode ?? -1, userInfo: nil)
        return error
    }
    func parseJson<T: Decodable> (_ jsonData: Data, ofType type: T.Type) -> Result<T, Error> {
        do {
            let decodedData = try JSONDecoder().decode(type, from: jsonData)
            return .success(decodedData)
        }catch {
            return .failure(error)
        }
    }
}
