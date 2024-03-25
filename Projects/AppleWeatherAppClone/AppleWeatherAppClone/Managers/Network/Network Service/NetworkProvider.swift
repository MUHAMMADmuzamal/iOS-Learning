//
//  NetworkProvider.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
class NetworkProvider {
    private let session = URLSession.shared
    func request<T: Decodable>(_ api: APITarget, completion: @escaping (Result<T, Error>) -> Void ) {
        session.dataTask(with: api.request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode) else {
                completion(.failure(self.handleServerError(response)))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "Data", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }
            let parsedJsonData = self.parseJson(data, ofType: T.self)
            completion(parsedJsonData)
        }.resume()
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
        } catch {
            return .failure(error)
        }
    }
}
