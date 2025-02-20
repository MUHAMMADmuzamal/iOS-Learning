//
//  CustomRoundedRectangle.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/02/2025.
//

import SwiftUI

struct Corners: OptionSet {
    let rawValue: Int
    
    static let topLeft     = Corners(rawValue: 1 << 0)
    static let topRight    = Corners(rawValue: 1 << 1)
    static let bottomLeft  = Corners(rawValue: 1 << 2)
    static let bottomRight = Corners(rawValue: 1 << 3)
    
    static let top: Corners = [.topLeft, .topRight]
    static let bottom: Corners = [.bottomLeft, .bottomRight]
    static let all: Corners = [.topLeft, .topRight, .bottomLeft, .bottomRight]
}

struct CustomRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    var corners: Corners

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start from top-left corner
        path.move(to: CGPoint(x: rect.minX + (corners.contains(.topLeft) ? cornerRadius : 0), y: rect.minY))

        // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX - (corners.contains(.topRight) ? cornerRadius : 0), y: rect.minY))
        if corners.contains(.topRight) {
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 270),
                        endAngle: Angle(degrees: 0),
                        clockwise: false)
        }

        // Bottom-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - (corners.contains(.bottomRight) ? cornerRadius : 0)))
        if corners.contains(.bottomRight) {
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 90),
                        clockwise: false)
        }

        // Bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX + (corners.contains(.bottomLeft) ? cornerRadius : 0), y: rect.maxY))
        if corners.contains(.bottomLeft) {
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 90),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
        }

        // Back to top-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + (corners.contains(.topLeft) ? cornerRadius : 0)))
        if corners.contains(.topLeft) {
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 180),
                        endAngle: Angle(degrees: 270),
                        clockwise: false)
        }

        path.closeSubpath()

        return path
    }
}
