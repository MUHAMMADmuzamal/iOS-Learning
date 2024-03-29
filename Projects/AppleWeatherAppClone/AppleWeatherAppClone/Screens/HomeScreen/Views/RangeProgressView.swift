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
                    .fill(.gray)
                Capsule()
                    .fill(LinearGradient(colors: [.red,.blue,.yellow,.orange,.green], startPoint: .leading, endPoint: .trailing ))
                    
                    .frame(width: geometry.size.width * fillWithScale)
                    .offset(x: geometry.size.width * range.lowerBound)
                Circle()
                    .strokeBorder(.green, lineWidth: 2.0)
                    .background(Circle().fill(Color.white))
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
    VStack {
        ProgressView(value: 0).progressViewStyle(RangeProgressView(range: 0.5...0.9)).frame(height: 10)
    }
}
