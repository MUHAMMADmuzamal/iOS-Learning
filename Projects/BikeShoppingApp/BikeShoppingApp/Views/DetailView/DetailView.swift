//
//  DetailView.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 01/06/2024.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            
            Color.gray3B
                .ignoresSafeArea()
            DetailViewBackGroundShape()
                .fill(LinearGradient.homeBackgroundLinearGradient)
                .padding(.bottom, 203)
                .rotationEffect(Angle(degrees: 1))
            VStack {
                DetailNavBar()
                Spacer()
                DetailViewMiddleSection()
                Spacer()
                BottomSection()
                    .frame(height: 450)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding([.leading, .trailing], 0)
                
                
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DetailNavBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 56) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeBackgroundLinearGradient)
                .frame(width: 40, height: 40)
            
                .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                .overlay {
                    Image(systemName: "chevron.left")
                    
                }
            Text("PEUGEOT - LR01")
                .font(.system(size: 20, weight: .bold, design: .default))
            Spacer()
            
        }
        .foregroundStyle(.white)
        .padding([.leading ,.trailing],20)
    }
}

struct DetailViewBackGroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        let start = CGPoint(x: width - 70, y: -100)
        
        return Path { path in
            path.move(to: start)
            path.addLine(to: CGPoint(x: width, y: -100))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            
            // Close the path
            path.closeSubpath()
        }
    }
}

struct DetailViewMiddleSection: View {
    var body: some View {
        TabView {
            ForEach(0..<5) { id in
                Image("bicycle-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 287, height: 222)
            }
          
        }
        .tabViewStyle(.page)
    }
}

struct BottomSection: View {
    var body: some View {
        ZStack {
            LinearGradient.homeTopSectionBackgroundLinearGradient
            VStack(spacing: 29) {
                
                HStack {
                    // Description button with outward shadows
                    Button(action: {
                        // Your button action here
                    }, label: {
                        Text("Description")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundStyle(LinearGradient.homeBackgroundLinearGradient)
                            .frame(width: 133, height: 43)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "#323B4F"))
                                    .shadow(color: Color(hex: "#38445A"), radius: 5, x: -4, y: -4)
                                    .shadow(color: Color(hex: "#252B39"), radius: 5, x: 4, y: 4)
                            )
                    })
                    
                    Spacer()
                    
                    // Specification button with inward shadows
                    Button(action: {
                        // Your button action here
                    }, label: {
                        Text("Specification")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundStyle(.white.opacity(0.6))
                            .frame(width: 133, height: 43)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "#28303F"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(hex: "#28303F"), lineWidth: 1)
                                            .shadow(color: Color(hex: "#202633"), radius: 1, x: 4, y: 4)
                                            .shadow(color: Color(hex: "#364055"), radius: 1, x: -4, y: -4)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                    )
                            )
                    })
                    
                }
                .padding(.top, 32)
                .padding([.leading, .trailing], 42)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("PEUGEOT - LR01")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .foregroundStyle(.white)
                    Text("The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundStyle(.white.opacity(0.6))
                }
                .padding(.leading, 20)
                .padding(.trailing, 35)
                Spacer()
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color.gray3D)
                    .frame(height: 104)
                    .shadow(color: Color(hex:"#1C222E"), radius: 40, x: 0, y: -10)
                    .overlay {
                        HStack {
                            Text("$ 1,999.99")
                                .font(.system(size: 24, weight: .regular, design: .default))
                                .foregroundStyle(Color.skyblueEA)
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                                    .fill(LinearGradient.homeBackgroundLinearGradient)
                                    .frame(width: 160, height: 44)
                                
                                    .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                                    .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                                    .overlay {
                                        Text("Add to cart")
                                            .font(.system(size: 15, weight: .medium, design: .default))
                                            .foregroundStyle(.white)
                                        
                                    }
                            })
                        }
                        .padding([.top, .bottom], 30)
                        .padding([.leading, .trailing], 35)
                    }
            }
        }
    }
}

#Preview {
    DetailView()
}
