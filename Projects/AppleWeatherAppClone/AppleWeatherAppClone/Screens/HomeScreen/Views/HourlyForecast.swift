//
//  HourlyForecast.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 24/02/2024.
//

import SwiftUI

struct HourlyForecast: View {
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
    var description: some View {
        Text("Cloudy conditions from 1AM-9AM, with showers expected at 9AM.")
            .font(.system(size: 14))
    }
    var forecastView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(0..<25, id: \.self) { _ in
                    SingleForecast(temperature: 21, iconName: "cloud.fill", time: "12AM")
                }
            }
        }
    }
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading) {
                Group {
                    description
                        .padding(.leading, leadingPadding)
                    divider
                    forecastView
                        .padding([.leading, .trailing], leadingPadding)
                }
                .foregroundStyle(Color.white)
            }
        }
        .overlay { border }
        .padding([.leading, .trailing], 10)
        .frame(height: 212)
    }
}

struct SingleForecast: View {
    let temperature: Int
    let iconName: String
    let time: String
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text(time)
            Image(systemName: iconName)
            Text("\(temperature)°")
                .padding(.leading, 5)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        HourlyForecast()
    }
}
