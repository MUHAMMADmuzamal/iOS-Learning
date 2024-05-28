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
                            
                                
                        }
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
        Parallelogram(depth: 20)
            .stroke(lineWidth: 5)
            .frame(width: 160, height: 160)
        Spacer()
        TabBar(selectedTab: .constant(.home))
            .frame(height: 103)
            .padding(.bottom, -1)
    }.ignoresSafeArea()
}


struct Parallelogram: Shape {
    
    var depth: CGFloat
    var cornerRadius: CGFloat = 10
    var flipped: Bool = false
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            if flipped {
                // Bottom-left corner
                p.move(to: CGPoint(x: 0, y: cornerRadius))
                p.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), control: CGPoint(x: 0, y: 0))
                
                // Top-right corner
                p.addLine(to: CGPoint(x: rect.width - cornerRadius, y: depth))
                p.addQuadCurve(to: CGPoint(x: rect.width, y: depth + cornerRadius), control: CGPoint(x: rect.width, y: depth))
                
                // Bottom-right corner
                p.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
                p.addQuadCurve(to: CGPoint(x: rect.width - cornerRadius, y: rect.height), control: CGPoint(x: rect.width, y: rect.height))
                
                // Top-left corner
                p.addLine(to: CGPoint(x: cornerRadius, y: rect.height - depth))
                p.addQuadCurve(to: CGPoint(x: 0, y: rect.height - depth - cornerRadius), control: CGPoint(x: 0, y: rect.height - depth))
            } else {
                // Top-left corner
                p.move(to: CGPoint(x: 0, y: depth + cornerRadius))
                p.addQuadCurve(to: CGPoint(x: cornerRadius, y: depth), control: CGPoint(x: 0, y: depth))
                
                // Top-right corner
                p.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
                p.addQuadCurve(to: CGPoint(x: rect.width, y: cornerRadius), control: CGPoint(x: rect.width, y: 0))
                
                // Bottom-right corner
                p.addLine(to: CGPoint(x: rect.width, y: rect.height - depth - cornerRadius))
                p.addQuadCurve(to: CGPoint(x: rect.width - cornerRadius, y: rect.height - depth), control: CGPoint(x: rect.width, y: rect.height - depth))
                
                // Bottom-left corner
                p.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
                p.addQuadCurve(to: CGPoint(x: 0, y: rect.height - cornerRadius), control: CGPoint(x: 0, y: rect.height))
            }
            p.closeSubpath()
        }
    }
}
