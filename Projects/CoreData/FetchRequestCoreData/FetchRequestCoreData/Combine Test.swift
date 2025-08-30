//
//  Combine Test.swift
//  FetchRequestCoreData
//
//  Created by Muhammad Muzamal on 30/08/2025.
//

import Foundation
import Combine

class CombineTest {
    
    var subscription: AnyCancellable?
    /*
     {
       "userId": 1,
       "id": 1,
       "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
       "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
     }
     */
    struct ResponseModel: Decodable {
        let userID: Int
        let id: Int
        let title: String
        let body: String

        
        enum CodingKeys: String, CodingKey {
            case userID = "userId"
            case id
            case title
            case body
        }
    }

    //URLSession.DataTaskPublisher is custom publisher that return from dataTaskPublisher
    //so we use eraseToAnyPublisher so when we map and decode data then it different kind of publisher so like protocol here we use AnyPublisher
    // - how we make custom publishers

    func makeAPICall<T:Decodable>() -> AnyPublisher<T, Error> {
        
        // https://jsonplaceholder.typicode.com/posts/1
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            return Fail(error: NSError(domain: "url not found", code: 0))
                .eraseToAnyPublisher()
        }
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        request.timeoutInterval = 10
        
        return session.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getData() -> AnyPublisher<ResponseModel, Error> {
        makeAPICall()
    }
    
    func run() {
        subscription = getData()
            .sink(receiveCompletion: { completion in
            switch completion {
                
            case .finished:
                print("✅ Finished.")
            case .failure(let error):
                print("🔥 Wrong URL")
            }
        }, receiveValue: { response in
            print("✅ ✅ ✅ ✅ ✅ Response")
            print(response)
        })
    }
}
