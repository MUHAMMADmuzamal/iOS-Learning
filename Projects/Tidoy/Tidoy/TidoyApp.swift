//
//  TidoyApp.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI
import IQKeyboardManagerSwift

@main
struct TidoyApp: App {
    let injector = DependenciesHolder.shared.injector()
    
    init() {
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(injector: injector)
                .environment(\.imageLoader, KingfisherImageLoader())
        }
    }
}
