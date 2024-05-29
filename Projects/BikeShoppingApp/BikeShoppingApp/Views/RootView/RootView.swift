//
//  RootView.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 29/05/2024.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: Tabs = .home
    var body: some View {
        VStack {
            Spacer()
            TabBar(selectedTab: $selectedTab)
                .frame(height: 103)
        }.ignoresSafeArea()
    }
}

#Preview {
    RootView()
}
