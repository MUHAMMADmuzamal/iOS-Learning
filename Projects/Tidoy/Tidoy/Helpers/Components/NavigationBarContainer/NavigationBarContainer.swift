//
//  NavigationBarContainer.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 07/05/2025.
//

import SwiftUI

struct NavigationBarContainer<Content: View>: View {
    private let content: Content
    
    // MARK: - Main initializer
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
}

// MARK: - Convenience Modifiers
extension NavigationBarContainer {
    /// Adds a navigation bar with back button and title
    func withNavigationBar(
        title: String,
        backAction: @escaping () -> Void,
        backgroundColor: Color = .background10,
        padding: CGFloat = .padding24
    ) -> some View {
        VStack(spacing: 0) {
            HStack {
                BackButtonView(action: backAction, text: title)
                Spacer()
            }
            .padding(.leading, padding)
            
            self
        }
        .background(backgroundColor.ignoresSafeArea())
        .toolbarVisibility(.hidden, for: .automatic)
    }
    
    /// Adds a custom navigation bar
    func withCustomNavigationBar<NavBar: View>(@ViewBuilder navBar: () -> NavBar) -> some View {
        VStack(spacing: 0) {
            navBar()
            self
        }
        .toolbarVisibility(.hidden, for: .automatic)
    }
    
    /// For views that already include their own navigation (or none at all)
    func withFullCustomization() -> some View {
        self
    }
}

// MARK: - Alternative Initializer for already-composed views
extension NavigationBarContainer {
    /// Initializer for views that already include navigation (or don't need it)
    static func fullyCustomized(@ViewBuilder content: () -> Content) -> some View {
        NavigationBarContainer(content: content)
    }
}


/**
 // 1. Basic content only
 NavigationBarContainer {
     Text("Main Content")
 }

 // 2. With standard navigation bar
 NavigationBarContainer {
     Text("Main Content")
 }
 .withNavigationBar(title: "Title", backAction: {})

 // 3. With custom navigation bar
 NavigationBarContainer {
     Text("Main Content")
 }
 .withCustomNavigationBar {
     MyCustomNavBar()
 }

 // 4. Fully customized view (may or may not include nav)
 NavigationBarContainer.fullyCustomized {
     MyPrecomposedViewWithNav()
 }

 // Alternative syntax for full customization
 NavigationBarContainer {
     MyPrecomposedViewWithNav()
 }
 .withFullCustomization()
 */

#Preview {
    NavigationBarContainer {
        VStack {
            Text("Main Content")
            Spacer()
        }
    }
    .withNavigationBar(title: "Title", backAction: {})
}
