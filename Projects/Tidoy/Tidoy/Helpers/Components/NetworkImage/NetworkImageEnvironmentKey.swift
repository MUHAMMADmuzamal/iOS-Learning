//
//  NetworkImageEnvironmentKey.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI

private struct ImageLoaderKey: EnvironmentKey {
    @MainActor
    static var defaultValue: any ImageLoader =  KingfisherImageLoader()
}

extension EnvironmentValues {
    var imageLoader: any ImageLoader {
        get {
            self[ImageLoaderKey.self]
        } set {
            self[ImageLoaderKey.self] = newValue
        }
    }
}
