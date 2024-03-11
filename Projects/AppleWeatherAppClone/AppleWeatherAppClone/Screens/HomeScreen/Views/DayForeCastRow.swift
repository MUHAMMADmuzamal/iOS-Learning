//
//  DayForeCastRow.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 24/02/2024.
//

import SwiftUI

private let model: DayRowForeCast =  DayRowForeCast(
    temperature: "10",
    rainPercentage: 27,
    day: "Mon",
    minTemperature: 1,
    maxTemperature: 25,
    uvIndex: 10,
    iconName: "sun.max.fill")

struct DayForeCastRow: View {
    @Binding var model: DayRowForeCast
    var minTemperature: some View {
        Text("\(model.minTemperature)°")
            .multilineTextAlignment(.leading)
            .foregroundStyle(Color.white.opacity(0.15))
            .frame(minWidth: 40, alignment: .leading)
    }
    var maxTemperature: some View {
        Text("\(model.maxTemperature)°")
            .multilineTextAlignment(.leading)
    }
    var uvIndex: some View {
        ProgressView(value: 1)
    }
    var iconsPlusPercentage: some View {
        VStack(alignment: .center) {
            Image(systemName: model.iconName)
            if model.rainPercentage !=  nil {
                Text("\(model.rainPercentage!)%")
                    .font(.system(size: 15))
                    .foregroundStyle(Color("blueFA"))
            }
        }
    }
    var day: some View {
        Text(model.day)
            .multilineTextAlignment(.leading)
            .frame(minWidth: 50, alignment: .leading)
    }
    var body: some View {
        HStack(spacing: 15) {
            day
            iconsPlusPercentage
            minTemperature
            uvIndex
            maxTemperature
        }
        .font(.system(size: 22, weight: .semibold))
        .foregroundStyle(Color.white)
        .padding(.all, 16)
    }
}

#Preview {
    ZStack {
        Color.gray
        DayForeCastRow(model: .constant(model))
    }
}
