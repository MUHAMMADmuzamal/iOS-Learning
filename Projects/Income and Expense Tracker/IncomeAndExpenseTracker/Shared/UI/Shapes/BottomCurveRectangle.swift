//
//  BottomCurveRectangle.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 20/09/2025.
//

import SwiftUI

struct BottomCurveRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height * 0.85
        let curveHeight = rect.height * 0.15
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: height))
        path.addQuadCurve(to: CGPoint(x: 0, y: height), control: CGPoint(x: rect.width / 2, y: height + curveHeight))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path
    }
}
