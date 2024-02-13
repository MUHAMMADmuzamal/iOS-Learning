//
//  ContentView.swift
//  CustomTabBarProject
//
//  Created by Codes Orbit on 12/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabBarItem = .home
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

#Preview {
    ContentView()
}
