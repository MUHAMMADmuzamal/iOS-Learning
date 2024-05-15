//
//  SplashBuilder.swift
//  MVC
//
//  Created by Codes Orbit on 15/05/2024.
//

import Foundation
class SplashBuilder {
    static func build() -> SplashView{
        let vc = SplashView.instantiateView(name: .splash)
        return vc
    }
}
