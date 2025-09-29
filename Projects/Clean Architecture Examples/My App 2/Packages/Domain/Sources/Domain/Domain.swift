// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public protocol UseCaseOutPut {
    func greetingComplete(_ value: String)
}

public  protocol UseCaseInput {
    func execute(_ value: String)
}

public final class DefaultUseCase: UseCaseInput {
    public var presenter: UseCaseOutPut?
    var repository: Repository
    
    public init(repository: Repository) {
        self.repository = repository
    }
    
    public func execute(_ value: String) {
        print("Default Use Case Executing: \(value)")
        let data: Entity = repository.fetchData()
        presenter?.greetingComplete(data.text)
    }
}



public protocol Repository {
    func fetchData() -> Entity
}


public struct Entity: Identifiable {
    public var id: Int
    public var text: String
    
    public init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}
