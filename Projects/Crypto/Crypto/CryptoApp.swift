//
//  CryptoApp.swift
//  Crypto
//
//  Created by Codes Orbit on 13/09/2024.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
               HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(homeViewModel)
        }
    }
}
