//
//  TabItem.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 24/04/2025.
//

import SwiftUI

struct TabItem<Content: View>: View {
    let tab: TabBarItems
    @Binding var selection: TabBarItems
    let content: Content

    init(_ tab: TabBarItems, selection: Binding<TabBarItems>, @ViewBuilder content: () -> Content) {
        self.tab = tab
        self._selection = selection
        self.content = content()
    }

    var body: some View {
        content
            .tabBarItems(tab: tab, selection: $selection)
    }
}

#Preview {
    TabItem(.home, selection: .constant(.home), content: {
        Color.red
    })
}
