//
//  DataLayer.swift
//  DataLayer
//
//  Created by Muhammad Muzamal on 24/09/2025.
//

import Foundation
import Domain

public final class LocalRepository: Repository {
    public init(){}
    public func fetchData() -> Entity {
        Entity(id: 1, text: "Hello World Greeting From Entity (Core)")
    }
}




