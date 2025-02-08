//
//  SignupRouter.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

final class SignupRouter {
    func navigate(to route: some Route, coordinator: AppCoordinator) {
        coordinator.path.append(route)
    }
}
