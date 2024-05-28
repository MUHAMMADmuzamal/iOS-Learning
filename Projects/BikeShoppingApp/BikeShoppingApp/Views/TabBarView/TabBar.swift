//
//  TabBar.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 23/05/2024.
//

import SwiftUI
enum Tabs: String, CaseIterable {
    case home, location, cart, profile, detail
    var icon: Image {
        switch self {
        case .home:
            return Image("homeIcon")
        case .location:
            return Image("locationIcon")
        case .cart:
            return Image("cartIcon")
        case .profile:
            return Image("profileIcon")
        case .detail:
            return Image("detailIcon")
        }
    }
    var selectedColor: LinearGradient {
        LinearGradient(colors: [Color("skyblueE9"), Color("purpleED")], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var unSelectedColor: LinearGradient {
        LinearGradient(colors: [Color.clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
struct TabBar: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        ZStack(alignment: .center) {
            //BackGround
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
                
                //Icons
                HStack{
                    ForEach(Tabs.allCases, id: \.rawValue){ tab in
                        Spacer()
                        ZStack {
                            tab.icon
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(tab == selectedTab ? Color.white : Color.white.opacity(0.6))
                                .frame(width: 25, height: 20)
                                
                        }
                        .frame(width: 40, height: 40, alignment: .center)
                        .background(tab == selectedTab ? tab.selectedColor : tab.unSelectedColor)
                            
                        Spacer()
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    VStack {
        Spacer()
        TabBar(selectedTab: .constant(.location))
            .frame(height: 103)
            .padding(.bottom, -1)
    }.ignoresSafeArea()
}
