//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by codes orbit on 26/08/2023.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
#if os(iOS)
        WindowGroup {
            AppStorageBootcamp()
//            TabView {
////                ContentView()
////                    .tabItem {
////                        Label("Journal", systemImage: "book")
////                    }
//                ButtonBootcamp()
//                
//                SettingsView()
//                    .tabItem {
//                        Label("Settings", systemImage: "gear")
//                    }
//            }
        }
#elseif os(macOS)
        WindowGroup {
            AlternativeContentView()
        }
        
        Settings {
            SettingsView()
        }
#endif
    }
}
