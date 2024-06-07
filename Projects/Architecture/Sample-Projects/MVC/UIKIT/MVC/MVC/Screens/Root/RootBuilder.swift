//
//  RootBuilder.swift
//  MVC
//
//  Created by Codes Orbit on 15/05/2024.
//

import Foundation
import Swinject

class RootBuilder {
    static func build(injector: Container) -> RootView{
        let vc = RootView.instantiateView(name: .root)
        return vc
    }
}
