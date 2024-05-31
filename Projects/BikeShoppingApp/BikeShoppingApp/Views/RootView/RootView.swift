//
//  RootView.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 29/05/2024.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: Tabs = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack {
            VStack{
                TabView(selection: $selectedTab) {
                    Home().tag(Tabs.home)
                    Text("Location").tag(Tabs.location)
                    Text("Cart").tag(Tabs.cart)
                    Text("Profile").tag(Tabs.profile)
                    Text("Detail").tag(Tabs.detail)
                }
            }
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
                    .frame(height: 103)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    RootView()
}
