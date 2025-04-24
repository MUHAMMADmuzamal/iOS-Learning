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
    @State private var tabs: [TabBarItems] = []
    
    
    init(selection: Binding<TabBarItems>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
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
