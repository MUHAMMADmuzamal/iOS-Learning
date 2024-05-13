//
//  Wind.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 31/03/2024.
//

import SwiftUI

struct Wind: View {
    var body: some View {
        BackgroundView(title: "WIND", iconName: "wind") {
            ZStack(alignment: .center) {
                DashCircle(count: 100)
                    .foregroundStyle(Color.white.opacity(0.1))
                DashCircle(count: 12)
                    .overlay {
                        VStack {
                            Spacer()
                            Text("N")
                            Spacer()
                            HStack {
                                Text("W")
                                Spacer()
                                VStack {
                                    Text("1")
                                        .font(.system(size: 23, weight: .bold, design: .default))
                                    Text("m/s")
                                }
                                Spacer()
                                Text("E")
                            }
                            Spacer()
                            Text("S")
                            Spacer()
                        }
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 20)
                    }
                    .foregroundStyle(Color.white)
                Image("arrow")
                    .resizable()
                    .scaledToFit()
            }
            .padding(5)
        }
    }
}

struct DashCircle: View {
    let count: Int
    
    var body: some View {
        GeometryReader { geometry in
            let radius = geometry.size.width / 2
            
            let centerX = geometry.size.width / 2
            let centerY = geometry.size.height / 2
            
            let lineHeight = 10.0
            let lineWidth = 1.0
            
            ZStack {
                Path { path in
                    let angleIncrement = 360.0 / Double(count)
                    for index in 0..<count {
                        let radian = Angle(degrees: Double(index) * angleIncrement).radians
 
                        let x1 = centerX + radius * cos(radian)
                        let y1 = centerY + radius * sin(radian)
                        let x2 = centerX + (radius - lineHeight) * cos(radian)
                        let y2 = centerY + (radius - lineHeight) * sin(radian)
                        
                        path.move(to: .init(x: x1, y: y1))
                        path.addLine(to: .init(x: x2, y: y2))
                    }
                }
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            }
            .padding(.bottom, 11)
        }
    }
}

// struct DashCircle1: View {
//    let count: Int
//    let lineHeight = 10.0
//    let lineWidth = 1.0
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let size = min(geometry.size.width, geometry.size.height)
//            ZStack {
//                ForEach(0..<count) { tick in
//                    VStack {
//                        Rectangle()
//                            .fill(tick % 5 == 0 ? .white : .red)
//                            .frame(width: lineWidth, height: lineHeight)
//                        Spacer()
//                    }
//                    .rotationEffect(.degrees(Double(tick) / Double(count)) * 360)
//                }
//            }
//            .frame(width: size, height: size)
//        }
//    }
// }


#Preview {
    ZStack {
        Color.blue
        Wind()
    }
}
