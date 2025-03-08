//
//  UserDefaults + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/03/2025.
//

import Foundation
import Combine

extension UserDefaults {
    
}

class TokenStorage {
    // - accessToken
    @Wrapper(key: "accessToken")
    static var accessToken: String?
    
    // - refreshToken
    @Wrapper(key: "refreshToken")
    static var refreshToken: String?
}

@propertyWrapper
struct Storage<T> {
    private let key: String
    private let defaultValue: T
    private var storage: UserDefaults = .standard
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            storage.object(forKey: key) as? T ?? defaultValue
        }
        set {
            storage.set(newValue, forKey: key)
        }
    }
}

@propertyWrapper
struct Wrapper<T: Codable> {
    private let key: String
    private var storage: UserDefaults = .standard
    private let publisher = PassthroughSubject<T?, Never>()
    
    var projectedValue: AnyPublisher<T?, Never> {
        publisher.eraseToAnyPublisher()
    }
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: T? {
        get {
            guard let data = storage.object(forKey: key) as? Data else { return nil }
            let value =  try? T.decode(from: data)
            return value
        }
        set {
            if newValue.isNil {
                storage.removeObject(forKey: key)
            } else {
                let data = try? newValue?.encode()
                storage.set(data, forKey: key)
            }
            self.publisher.send(newValue)
        }
    }
}

private protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
