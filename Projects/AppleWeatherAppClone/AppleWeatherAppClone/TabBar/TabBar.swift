//
//  TabBar.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 02/03/2024.
//

import SwiftUI

struct TabBar: View {
@State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .toolbar(.hidden, for: .tabBar)
            Text("Tab Content 2")
                .tag(1)
                .toolbar(.hidden, for: .tabBar)
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }

    }
}

#Preview {
    TabBar()
}
