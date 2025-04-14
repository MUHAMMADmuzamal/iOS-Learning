//
//  TabBarContainerView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/04/2025.
//

import SwiftUI

struct TabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItems
    let content: Content
    @State private var tabs: [TabBarItems] = [.home, .wishList, .stay, .profile]
    
    
    init(selection: Binding<TabBarItems>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            TabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKeys.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    TabBarContainerView(selection: .constant(.home)) {
        Color.red
    }
}





struct TabBarItemsPreferenceKeys: PreferenceKey {
    
    static var defaultValue: [TabBarItems] = []
    
    static func reduce(value: inout [TabBarItems], nextValue: () -> [TabBarItems]) {
        value += nextValue()
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

extension View {
    
    func tabBarItems(tab: TabBarItems, selection: Binding<TabBarItems>) -> some View {
//        modifier(TabBarItemViewModifer(tab: tab, selection: selection))
        modifier(TabBarItemsViewModiferWithOnAppear(tab: tab, selection: selection))
    }
    
}
