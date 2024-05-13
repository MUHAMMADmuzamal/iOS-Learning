//
//  CustomTabBar.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 03/03/2024.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.white.opacity(0.3))
            HStack {
                HStack {
                    Image(systemName: "map")
                    Spacer()
                }
                .onTapGesture {
                    selectedTab = 0
                }
                HStack {
                    Image(systemName: "location")
                    Circle().frame(width: 10)
                }
                HStack {
                    Spacer()
                    Image(systemName: "list.bullet")
                }
                .onTapGesture {
                    selectedTab = 1
                }
            }
            .frame(height: 40)
            .padding([.leading, .trailing], 20)
            .foregroundStyle(Color.white)
            .background(Color(hex: "#2A3040"))
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        CustomTabBar(selectedTab: .constant(0))
    }
}
