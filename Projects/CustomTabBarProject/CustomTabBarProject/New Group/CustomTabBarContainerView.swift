//
//  CustomTabBarContainerView.swift
//  CustomTabBarProject
//
//  Created by Codes Orbit on 12/02/2024.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self, perform: { value in
            tabs = value
        })
    }
}

#Preview {
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.green
    }
}
