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
    @State var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UITableView.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().tintColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationSplitView(sidebar: {
                    HomeView()
                         .toolbar(.hidden)
                }, detail: {
                    
                })
                .environmentObject(homeViewModel)
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
                
            }
            
        }
    }
}
