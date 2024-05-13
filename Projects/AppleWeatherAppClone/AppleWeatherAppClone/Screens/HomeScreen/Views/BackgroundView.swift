//
//  BackgroundView.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 23/03/2024.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    let title: String
    let iconName: String
    let content: Content
    let radius: CGFloat = 15.0
    let leadingPadding: CGFloat = 17.0
    init(title: String, iconName: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.iconName = iconName
        self.content = content()
    }
    var border: some View {
        RoundedRectangle(cornerRadius: radius)
            .stroke(lineWidth: 0.5)
            .foregroundStyle(Color.white.opacity(0.2))
    }
    var background: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(Color.clear)
    }
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading) {
                HStack {
                    Label(
                        title: { 
                            Text(title)
                                .font(.system(size: 15))
                        },
                        icon: { Image(systemName: iconName) }
                    ).foregroundStyle(Color.white.opacity(0.3))
                    Spacer()
                }.padding(.bottom, 5)
                content
                Spacer()
            }
            .padding([.leading, .top, .trailing], 15)
        }
        .overlay { border }
    }
}

#Preview {
    ZStack {
        Color.blue
        BackgroundView(title: "AIR QUALITY", iconName: "42.circle") {
            Text("Hello")
        }
            .frame(height: 220)
            .padding([.leading, .top, .trailing], 10)
    }
}
