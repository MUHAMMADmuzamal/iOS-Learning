//
//  TabBarItemModifier.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 24/04/2025.
//

import SwiftUI

extension View {
    
    func tabBarItems(tab: TabBarItems, selection: Binding<TabBarItems>) -> some View {
        modifier(TabBarItemsViewModiferWithOnAppear(tab: tab, selection: selection))
    }
}


struct TabBarItemsViewModiferWithOnAppear: ViewModifier {
    
    let tab: TabBarItems
    @Binding var selection: TabBarItems
    
    @ViewBuilder func body(content: Content) -> some View {
        if selection == tab {
            content
                .opacity(1)
                .preference(key: TabBarItemsPreferenceKeys.self, value: [tab])
        } else {
            Text("")
                .opacity(0)
                .preference(key: TabBarItemsPreferenceKeys.self, value: [tab])
        }
    }
}

#Preview {
    Color.red.tabBarItems(tab: .home, selection: .constant(.home))
}
