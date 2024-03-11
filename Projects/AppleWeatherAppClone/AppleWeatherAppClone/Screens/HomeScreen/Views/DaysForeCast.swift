//
//  DaysForeCast.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 24/02/2024.
//

import SwiftUI

private let daysForecastRowModelData = [
    DayRowForeCast(
        temperature: "10",
        rainPercentage: 27,
        day: "Mon",
        minTemperature: 15,
        maxTemperature: 25,
        uvIndex: 10,
        iconName: "sun.max.fill"),
    DayRowForeCast(
        temperature: "25",
        rainPercentage: 7,
        day: "Tue",
        minTemperature: 10,
        maxTemperature: 20,
        uvIndex: 10,
        iconName: "sun.max.fill"),
    DayRowForeCast(
        temperature: "27",
        rainPercentage: 50,
        day: "Wed",
        minTemperature: 1,
        maxTemperature: 35,
        uvIndex: 4,
        iconName: "sun.max.fill"),
    DayRowForeCast(
        temperature: "50",
        rainPercentage: 7,
        day: "Wed",
        minTemperature: 1,
        maxTemperature: 35,
        uvIndex: 4,
        iconName: "sun.max.fill")
]

struct DaysForeCast: View {
    @Binding var  daysForeCastList: [DayRowForeCast]
    let radius: CGFloat = 15.0
    let leadingPadding: CGFloat = 17.0
    var border: some View {
        RoundedRectangle(cornerRadius: radius)
            .stroke(lineWidth: 0.5)
            .foregroundStyle(Color.white.opacity(0.2))
    }
    var background: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(Color.clear)
    }
    var divider: some View {
        Divider()
            .overlay {
                Color.white.opacity(0.2)
            }
    }
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "calendar")
                    Text("10-DAY  FORECAST")
                }
                .padding(.leading, 16)
                .padding(.bottom, 6)
                divider
                ForEach($daysForeCastList) { data in
                    DayForeCastRow(model: data)
                    divider
                        .padding([.leading, .trailing], 16)
                }
                Spacer()
            }
            .padding(.top, 14)
            .foregroundStyle(Color.white)
        }
        .overlay { border }
        .padding([.leading, .trailing], 10)
    }
}

#Preview {
    ZStack {
        Color.green
        DaysForeCast(daysForeCastList: .constant(daysForecastRowModelData))
    }
}
