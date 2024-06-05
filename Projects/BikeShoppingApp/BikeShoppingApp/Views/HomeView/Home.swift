//
//  Home.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 29/05/2024.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            
            Color.gray3B
                .ignoresSafeArea()
            BackGroundShape()
                .fill(LinearGradient.homeBackgroundLinearGradient)
            
            VStack(spacing: 0) {
                NavBar()
                ScrollView(.vertical) {
                    VStack {
                        TopSection()
                            .frame(height: 250)
                            .padding([.leading, .trailing], 20)
                            .padding(.top, 42)
                        
                        MiddleSection()
                            .padding(.top, -15)
                        LastSection()
                        Spacer()
                    }
                    .padding(.bottom, 120)
                }
            }
        }
    }
}

struct NavBar: View {
    var body: some View {
        HStack {
            Text("Choose Your Bike")
                .font(.system(size: 20, weight: .bold, design: .default))
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeBackgroundLinearGradient)
                .frame(width: 40, height: 40)
                
                .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                .overlay {
                    Image(systemName: "magnifyingglass")
                        
                }
           
        }
        .foregroundStyle(.white)
        .padding([.leading ,.trailing],20)
    }
}

struct TopSection: View {
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        ZStack(alignment: .top) {
            TopSectionBackGroundShape()
                .fill(LinearGradient.homeTopSectionBackgroundLinearGradient.opacity(0.6))
                .background {
                    TopSectionBackGroundShape()
                        
                        .fill(Material.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                }
                .overlay {
                    TopSectionBackGroundShape()
                        .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2))
                }
                
            
            VStack(alignment: .leading) {
                Image("bicycle-top-section")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 153)
                    .padding(.top, 30)
                    .padding([.leading, .trailing], 17)
                Text("30% off")
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundStyle(Color.white.opacity(0.6))
            }
                
                
                
        }
        .shadow(color: Color.gray5F.opacity(0.5), radius: 60, x: 0, y: -20)
        .shadow(color: Color.gray1C.opacity(0.6), radius: 60, x: 0, y: 20)
    }
}

struct BackGroundShape: Shape {
    func path(in rect: CGRect) -> Path {
            let width = rect.size.width
            let height = rect.size.height
            let start = CGPoint(x: width - 120, y: height * 0.12)
            
        return Path { path in
                path.move(to: start)
                path.addLine(to: CGPoint(x: width, y: height * 0.2))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
                
                // Close the path
                path.closeSubpath()
            }
    }
}

struct TopSectionBackGroundShape: Shape {
    private let cornerRadius: CGFloat = 20
    func path(in rect: CGRect) -> Path {
            let width = rect.size.width
            let height = rect.size.height
            let topLeft = CGPoint(x: 0, y: 0)
            let topRight = CGPoint(x: width, y: 0)
            let bottomRight = CGPoint(x: width, y: height)
            let bottomLeft = CGPoint(x: 0, y: height)
            
        return Path { path in
            // Start at top-left corner (after corner radius)
            path.move(to: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y))
            
            // Top edge and top-right corner
            path.addLine(to: CGPoint(x: topRight.x - cornerRadius, y: topRight.y))
            path.addQuadCurve(to: CGPoint(x: topRight.x, y: topRight.y + cornerRadius), control: CGPoint(x: topRight.x, y: topRight.y))
            
            // Right edge and bottom-right corner
            path.addLine(to: CGPoint(x: bottomRight.x, y: (bottomRight.y - cornerRadius) * 0.8))
            path.addQuadCurve(to: CGPoint(x: bottomRight.x - cornerRadius, y: bottomRight.y * 0.81), control: CGPoint(x: bottomRight.x, y: bottomRight.y * 0.8))
            
            // Bottom edge and bottom-left corner
            path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y))
            path.addQuadCurve(to: CGPoint(x: bottomLeft.x, y: bottomLeft.y - cornerRadius), control: CGPoint(x: bottomLeft.x, y: bottomLeft.y))
            
            // Left edge and top-left corner
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + cornerRadius))
            path.addQuadCurve(to: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y), control: CGPoint(x: topLeft.x, y: topLeft.y))
            
            // Close the path
            path.closeSubpath()
        }
    }
}

struct MiddleSection: View {
    var body: some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeBackgroundLinearGradient)
                .frame(width: 50, height: 50)
                .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                .overlay {
                    Text("All")
                        .foregroundStyle(.white)
                }
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeTopSectionBackgroundLinearGradient.opacity(0.6))
                .overlay {
                    Image("electric-bicycle")
                }
                .frame(width: 50, height: 50)
                .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                .padding(.bottom, 15)
            
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeTopSectionBackgroundLinearGradient.opacity(0.6))
                .overlay {
                    Image("road")
                }
                .frame(width: 50, height: 50)
                .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                .padding(.bottom, 30)
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeTopSectionBackgroundLinearGradient.opacity(0.6))
                .overlay {
                    Image("hill")
                }
                .frame(width: 50, height: 50)
                .padding(.bottom, 45)
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeTopSectionBackgroundLinearGradient.opacity(0.6))
                .overlay {
                    Image("helment")
                }
                .frame(width: 50, height: 50)
                .padding(.bottom, 55)
            Spacer()
            
        }
        .frame(height: 90)
    }
}

struct LastSection: View {
    var body: some View {
        
        Grid(alignment: .top, horizontalSpacing: 20, verticalSpacing: 0) {
            
            GridRow {
                LastSectionCard(imageName: "bicycle-1", title: "Road Bike", description: "PEUGEOT - LR01", price: "$ 1,999.99", selected: true)
                    .scaleEffect(CGSize(width: 1.1, height: 1.1))
                    
                LastSectionCard(imageName: "bicycle-1", title: "Road Bike", description: "PEUGEOT - LR01", price: "$ 1,999.99", selected: false)
            }
            GridRow {
                LastSectionCard(imageName: "bicycle-1", title: "Road Bike", description: "PEUGEOT - LR01", price: "$ 1,999.99", selected: false)
                    
                LastSectionCard(imageName: "bicycle-1", title: "Road Bike", description: "PEUGEOT - LR01", price: "$ 1,999.99", selected: false)
                
            }
        }
    }
}

struct LastSectionCard: View {
    let imageName: String
    let title: String
    let description: String
    let price: String
    let selected: Bool
    var body: some View {
        Parallelogram(depth: 20, cornerRadius: 20)
            .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
            .fill(LinearGradient.homeTopSectionBackgroundLinearGradient.opacity(0.6))
            .frame(width: 165, height:  219)
            .padding(.bottom, 31)
            .shadow(color: selected ? Color(hex:"#2B3445").opacity(0.5) : .clear, radius: 40, x: 0, y: -20)
            .shadow(color: selected ? Color(hex:"#10141C"): .clear, radius: 60, x: 0, y: 20)
            .shadow(color: selected ? .clear : Color(hex:"#526C8F"), radius: 100, x: 0, y: 20)
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Image("heart")
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                    }
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 121, height: 88, alignment: .center)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                        Text(description)
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundStyle(.white)
                        Text(price)
                           
                    }
                    .frame(height: 63)
                    .font(.system(size: 13, weight: .medium, design: .default))
                    .foregroundStyle(Color.white.opacity(0.6))
                    
                    Spacer()
                }
                .padding([.leading, .trailing], 17)
                .padding(.top, 22)
            }
        
    }
}

struct CustomBlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

#Preview {
    Home()
}
