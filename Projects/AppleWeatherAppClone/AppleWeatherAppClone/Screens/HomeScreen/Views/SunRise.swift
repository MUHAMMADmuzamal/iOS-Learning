//
//  SunRise.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 25/03/2024.
//

import SwiftUI

struct SunRise: View {
    let dayColor: Color
    let nightColor: Color
    let amplitude: CGFloat
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                Wave(amplitude: amplitude)
                    .stroke(nightColor, lineWidth: 5)
                Rectangle()
                    .frame(height: 1)
                Circle()
                    .frame(width: 15)
                    .position(Wave.point(
                        for: 120,
                        in: CGRect(origin: .zero, size: geometry.size), amplitude: amplitude))
            }
        })
    }
}

#Preview {
    HStack {
        SunRise(dayColor: .green, nightColor: .red, amplitude: 30)
        SunRise(dayColor: .blue, nightColor: .orange, amplitude: 30)
    }
}

struct Wave: Shape {
    let resolution: Int = 100
    let amplitude: CGFloat
    
    static func point(for x: CGFloat, in rect: CGRect, amplitude: CGFloat) -> CGPoint {
        let frequency = 1 * (2 * 3.1415)
//        let width = rect.width
        let wavelength = rect.width / CGFloat(frequency)
        let relativeX = x / wavelength
        let yaxis = (cos(relativeX) * amplitude) + rect.midY
        return CGPoint(x: x, y: yaxis)
    }
    
    func path(in rect: CGRect) -> Path {
        let frequency = 1 * (2 * 3.1415)
        let width = rect.width
        let wavelength = rect.width / CGFloat(frequency)
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        let path = UIBezierPath()
        path.move(to: startPoint)
        for xaxis in stride(from: 0, through: width, by: 1) {
            let relativeX = xaxis / wavelength
            let yaxis = (cos(relativeX) * amplitude) + startPoint.y
            let point = CGPoint(x: xaxis, y: yaxis)
            if xaxis == 0 {
                path.move(to: point)
                continue
            }
            path.addLine(to: point)
        }
        return Path(path.cgPath)
    }
}
