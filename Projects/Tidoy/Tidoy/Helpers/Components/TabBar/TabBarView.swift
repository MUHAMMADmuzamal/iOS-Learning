//
//  TabBarView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/04/2025.
//

import SwiftUI

struct TabBarView: View {
    let tabs: [TabBarItems]
    @Binding var selection: TabBarItems
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                VStack {
                    tabImage(for: tab)
                    tabTitle(for: tab)
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    switchToTab(tab: tab)
                }
            }
        }
        .padding(.top, .padding8)
        .padding(.bottom, .padding16)
        .background(Color.background10)
    }
    
    @ViewBuilder
    private func tabImage(for tab: TabBarItems) -> some View {
        if tab == selection {
            tab.selectedImage
        } else {
            tab.unselectedImage
                .foregroundStyle(Color.icon90)
        }
    }
    
    @ViewBuilder
    private func tabTitle(for tab: TabBarItems) -> some View {
        if tab == selection {
            Text(tab.title)
                .font(.body2XSmallSemiBold)
                .foregroundStyle(Color.text100)
        } else {
            Text(tab.title)
                .font(.bodySmallRegular)
                .foregroundStyle(Color.text80)
        }
    }
    
    private func switchToTab(tab: TabBarItems) {
        selection = tab
    }
}

#Preview {
    TabBarView(tabs: [.home, .wishList, .stay, .profile], selection: .constant(.home))
}
