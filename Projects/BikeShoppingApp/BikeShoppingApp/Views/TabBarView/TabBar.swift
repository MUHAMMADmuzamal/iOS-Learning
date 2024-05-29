//
//  TabBar.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 23/05/2024.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        ZStack(alignment: .center) {
            //BackGround
            TabBarBackground()
            
            //Icons
            HStack{
                ForEach(Tabs.allCases, id: \.rawValue){ tab in
                    Spacer()
                    ZStack {
                        if tab == selectedTab {
                            
                            Parallelogram(depth: 5)
                                .fill(tab.selectedColor)
                                .overlay(content: {
                                    tab.icon
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(Color.white)
                                        .frame(width: 25, height: 20)
                                })
                                .frame(width: 60, height: 60)
                                .offset(y: -15)
                            
                        }else {
                            tab.icon
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(Color.white.opacity(0.6))
                                .frame(width: 25, height: 20)
                        }
                    }.onTapGesture {
                        selectedTab = tab
                    }
                    Spacer()
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct TabBarBackground: View {
    var body: some View {
        GeometryReader { proxy in
            let startPoint = CGPoint(x: 0, y: proxy.size.height * 0.2)
            let endPoint = CGPoint(x: proxy.size.width, y: 0)
            Path { path in
                path.move(to: startPoint)
                path.addLine(to: endPoint)
                path.addLine(to: CGPoint(x: proxy.size.width, y: proxy.size.height))
                path.addLine(to: CGPoint(x: 0, y: proxy.size.height))
                path.addLine(to: startPoint)
                path.closeSubpath()
                
            }
            .fill(LinearGradient.tabBarLinearGradient)
            .fill(LinearGradient.tabBarLinearGradient2)
            .overlay {
                Path { path in
                    path.move(to: startPoint)
                    path.addLine(to: endPoint)
                    path.addLine(to: CGPoint(x: proxy.size.width, y: proxy.size.height))
                }
                .stroke(
                    LinearGradient.tabStrokeLinearGradient.opacity(0.2),
                    lineWidth: 5.0)
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
        Parallelogram(depth: 20)
            .stroke(lineWidth: 5)
            .frame(width: 160, height: 160)
        Spacer()
        TabBar(selectedTab: .constant(.home))
            .frame(height: 103)
            .padding(.bottom, -1)
    }.ignoresSafeArea()
}


