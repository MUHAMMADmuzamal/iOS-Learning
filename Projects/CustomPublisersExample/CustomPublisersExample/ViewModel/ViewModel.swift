//
//  ViewModel.swift
//  CustomPublisersExample
//
//  Created by Codes Orbit on 27/03/2024.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    private var cancellable =  Set<AnyCancellable>()
    private var decoder = JSONDecoder()
    private var session = URLSession.shared
    private let url = URL(string: "https://jobs.github.com/positions.json?description=swift")!
    @Published public var jobs:[JobModel] = []
    
    func load() {
        let request = URLRequest(url: url)
        session.dataResponse(for: request)
            .decode(type: [JobModel].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { (error) in
                print(error)
            } receiveValue: { (jobs) in
                print(jobs)
                self.jobs = jobs
            }.store(in: &cancellable)
    }
}
