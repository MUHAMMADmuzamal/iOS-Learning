//
//  Tabbar.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 09/04/2025.
//
import Foundation
import SwiftUI


//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            TestTabView(text: "1")
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            TestTabView(text: "2")
                .tabBarItem(tab: .messages, selection: $tabSelection)

            TestTabView(text: "3")
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            TestTabView(text: "4")
                .tabBarItem(tab: .favorites, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}


//
//  CustomTabBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

struct CustomTabBarContainerView<Content:View>: View {
    
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
            
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home, .favorites, .profile
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}



//
//  CustomTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBarVersion2
            .onChange(of: selection, perform: { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            })
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home, .favorites, .profile
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
}

extension CustomTabBarView {
    
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
}






//
//  TabBarItem.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//
//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, favorites, profile, messages
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        case .messages: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .messages: return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.red
        case .favorites: return Color.blue
        case .profile: return Color.green
        case .messages: return Color.orange
        }
    }
}




//
//  TabBarItemsPreferenceKey.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//



struct TabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
    
}

struct TabBarItemViewModifer: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
    
}

struct TabBarItemViewModiferWithOnAppear: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    @ViewBuilder func body(content: Content) -> some View {
        if selection == tab {
            content
                .opacity(1)
                .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
        } else {
            Text("")
                .opacity(0)
                .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
        }
    }
    
}

extension View {
    
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
//        modifier(TabBarItemViewModifer(tab: tab, selection: selection))
        modifier(TabBarItemViewModiferWithOnAppear(tab: tab, selection: selection))
    }
    
}

























