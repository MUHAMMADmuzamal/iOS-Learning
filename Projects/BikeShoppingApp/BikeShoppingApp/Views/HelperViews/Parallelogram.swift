//
//  Parrelalogram.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 29/05/2024.
//

import SwiftUI
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
