//
//  Route.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 09/02/2025.
//

import SwiftUI

protocol Route: Hashable {
    associatedtype Destination: View
    @ViewBuilder func destinationView() -> Destination
}

struct AnyRoute: Hashable {
    private let _destinationView: () -> AnyView
    private let _hashValue: Int

    init<R: Route>(_ route: R) {
        self._destinationView = { AnyView(route.destinationView()) }
        self._hashValue = route.hashValue
    }

    func destinationView() -> AnyView {
        _destinationView()
    }

    static func == (lhs: AnyRoute, rhs: AnyRoute) -> Bool {
        lhs._hashValue == rhs._hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(_hashValue)
    }
}
