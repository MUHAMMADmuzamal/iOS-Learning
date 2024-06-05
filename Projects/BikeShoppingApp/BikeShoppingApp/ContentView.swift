//
//  ContentView.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 21/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("img001")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Text("Hello World")
                .padding()
                .frame(width: 300)
                .glassmorphed(cornerRadius: 50)
            VStack {
                Circle()
                    .fill(.clear)
                    .frame(width: 60)
                    .glassmorphed(cornerRadius: 30)
            }
        }
        
    }
}

struct Glassify: ViewModifier {
    
    @Environment(\.colorScheme) private var colorScheme
    private let cornerRadius: CGFloat
    private var gradientColors: [Color] {
        [
            .white.opacity(colorScheme == .dark ? 0.1 : 1),
            .white.opacity(colorScheme == .dark ? 0.4 : 0.1),
            .white.opacity(colorScheme == .dark ? 0.04 : 0.1),
            .white.opacity(colorScheme == .dark ? 0.15 : 0.4),
            .white.opacity(colorScheme == .dark ? 0.20 : 0.5),
        ]
    }
    init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.ultraThinMaterial)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
            }

    }
}

extension View {
    func glassmorphed(cornerRadius: CGFloat) ->  some View {
        modifier(Glassify(cornerRadius: cornerRadius))
    }
}
#Preview {
    ContentView()
}
