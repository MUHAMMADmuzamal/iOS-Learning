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
                    .fill(RadialGradient(colors: [.red,.blue,.yellow,.orange,.green], center: .center, startRadius: 50, endRadius: 30))
//                    .fill(LinearGradient(colors: [.red,.blue,.yellow,.orange,.green], startPoint: .leading, endPoint: .trailing ))
                    
                    .frame(width: geometry.size.width * fillWithScale)
                    .offset(x: geometry.size.width * range.lowerBound)
            }
        }
    }
    var fillWithScale : Double {
        let normalRange = range.upperBound -  range.lowerBound
        return Double(normalRange)
    }
}

#Preview {
    VStack {
        ProgressView(value: 0).progressViewStyle(RangeProgressView(range: 0.5...0.9)).frame(height: 10)
    }
}
