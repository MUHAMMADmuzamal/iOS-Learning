//
//  RangeProgressView.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 26/03/2024.
//

import SwiftUI

struct RangeProgressView: ProgressViewStyle {
    let range: ClosedRange<Double>
    func makeBody(configuration: Configuration) -> some View {
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.clear)
                Capsule()
                    .fill(LinearGradient(colors: [Color(hex: "#65DB7C"),
                                                  Color(hex: "#F5E753"),
                                                  Color(hex: "#E63A52"),
                                                  Color(hex: "#E63A52"),
                                                  Color(hex: "#B55DE0"),
                                                 ], startPoint: .leading, endPoint: .trailing ))
                    
                    .frame(width: geometry.size.width * fillWithScale)
                    .offset(x: geometry.size.width * range.lowerBound)
                Circle()
                    .strokeBorder(.black, lineWidth: 2.0)
                    .background(Circle().fill(Color.white).padding(2))
                    .position(x: geometry.size.width * (configuration.fractionCompleted ?? 0.0), y: geometry.size.height / 2)
            }
        }
    }
    var fillWithScale: Double {
        let normalRange = range.upperBound -  range.lowerBound
        return Double(normalRange)
    }
}

#Preview {
    ZStack {
        Color.blue
        VStack {
            ProgressView(value: 0.7).progressViewStyle(RangeProgressView(range: 0.5...0.9)).frame(height: 10)
        }
    }
}
