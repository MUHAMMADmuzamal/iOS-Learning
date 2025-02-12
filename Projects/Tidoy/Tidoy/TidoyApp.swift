//
//  TidoyApp.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI

@main
struct TidoyApp: App {
    let injector = DependenciesHolder().injector()
    
    var body: some Scene {
        WindowGroup {
            RootView(injector: injector)
        }
    }
}
