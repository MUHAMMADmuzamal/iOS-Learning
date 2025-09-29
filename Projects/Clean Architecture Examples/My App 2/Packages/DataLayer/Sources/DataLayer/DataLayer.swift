// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import Domain

public final class LocalRepository: Repository {
    public init(){}
    public func fetchData() -> Entity {
        Entity(id: 1, text: "Hello World Greeting From Entity (Core)")
    }
}
