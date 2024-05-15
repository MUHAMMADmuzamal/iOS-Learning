//
//  RootBuilder.swift
//  MVC
//
//  Created by Codes Orbit on 15/05/2024.
//

import Foundation
class RootBuilder {
    static func build() -> RootView{
        let vc = RootView.instantiateView(name: .root)
        return vc
    }
}
