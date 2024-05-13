//
//  CurrentWeatherForecast.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 24/02/2024.
//

import SwiftUI

struct CurrentWeatherForecast: View {
    @Binding var model: CurrentWeatherForecastModel
    var body: some View {
        VStack(alignment: .center) {
            Text(model.cityName)
                .font(.system(size: 37.0))
            Text("\(model.temperature)°")
                .font(.system(size: 102, weight: .light))
                .padding(.leading, 30)
            Text(model.weatherType)
                .font(.system(size: 24.0))
            HStack {
                Text("H:\(model.highTemperature)°")
                Text("L:\(model.lowTemperature)°")
            }
            .font(.system(size: 21.0))
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(Color.white)
    }
}

private let model = CurrentWeatherForecastModel(
    cityName: "Seongnam-si",
    temperature: 21,
    weatherType: "Partly Cloudy",
    highTemperature: 29,
    lowTemperature: 15)

#Preview {
    ZStack {
        Color.black
        CurrentWeatherForecast(model: .constant(model))
    }
}
