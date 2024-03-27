//
//  OtherComponents.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 23/03/2024.
//

import SwiftUI

struct OtherComponents: View {
    var divider: some View {
        Divider()
            .overlay {
                Color.white.opacity(0.2)
            }
    }
    var uvIndex: some View {
        ProgressView(value: 1)
    }
    var airQuality: some View {
        BackgroundView(title: "AIR QUALITY", iconName: "aqi.medium") {
            VStack(alignment: .leading) {
                Text("56 - Moderate")
                    .font(.system(size: 23))
                    .padding(.bottom, 8)
                Text("Air quality is 56, which is the same as yesterday at about this time.")
                    .font(.system(size: 17))
                    .padding(.bottom, 10)
                uvIndex
                    .padding(.bottom, 26)
                divider
                HStack {
                    Text("See More")
                        .font(.system(size: 17))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.white.opacity(0.2))
                        .frame(width: 10, height: 16)
                }
                .padding(.top, 8)
                .padding(.bottom, 15)
            }
            .foregroundStyle(Color.white)
        }
    }
    var temperature: some View {
        BackgroundView(title: "TEMPERATURE", iconName: "thermometer.low") {
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.orange)
                    .overlay {
                        Text("Map")
                    }
                    .foregroundStyle(Color.black)
                    .frame(height: 195)
                HStack {
                    Text("See More")
                        .font(.system(size: 17))
                        .foregroundStyle(Color.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.white.opacity(0.2))
                        .frame(width: 10, height: 16)
                }
                .padding(.top, 8)
                .padding(.bottom, 15)
            }
        }
    }
    var uvIndexView: some View {
        BackgroundView(title: "UV INDEX", iconName: "sun.max.fill") {
            VStack(alignment: .leading) {
           Text("0")
                    .font(.system(size: 36))
           Text("Low")
                    .font(.system(size: 22))
            uvIndex
                .padding(.bottom, 26)
                .padding([.leading, .trailing], 15)
           Text("Low for the rest of the day.")
                    .font(.system(size: 18))
            }
            .padding(.bottom, 11)
        }
        .foregroundStyle(Color.white)
    }
    var sunRise: some View {
        BackgroundView(title: "SUN RISE", iconName: "sunrise.fill") {
            VStack(alignment: .center) {
                Text("6:28 AM")
                    .font(.system(size: 35))
                SunRise(dayColor: .blue, nightColor: .red, amplitude: 30)
                Text("Sunset: 6:10 PM")
                    .font(.system(size: 18))
            }
            .padding(.bottom, 11)
        }
        .foregroundStyle(Color.white)
    }
    var wind: some View {
        BackgroundView(title: "WIND", iconName: "wind") {
            VStack(alignment: .center) {
                Spacer().frame(minHeight: 114)
            }
            .padding(.bottom, 11)
        }
        .foregroundStyle(Color.white)
    }
    var rainFall: some View {
        BackgroundView(title: "RAINFALL", iconName: "drop.fill") {
            VStack(alignment: .leading) {
           Text("0 mm")
                    .font(.system(size: 35))
           Text("in last 24h")
                    .font(.system(size: 23))
                    .padding(.bottom, 8)
           Text("4 mm expected in next 24h.")
                    .font(.system(size: 17))
            }
            .padding(.bottom, 11)
        }
        .foregroundStyle(Color.white)
    }
    var feelsLike: some View {
        BackgroundView(title: "FEELSLIKE", iconName: "thermometer.medium") {
            VStack(alignment: .leading) {
           Text("73 %")
                    .font(.system(size: 35))
           Text("Similar to the actual temperature")
                    .font(.system(size: 17))
                    .padding(.bottom, 8)
            }
            .padding(.bottom, 11)
        }
        .foregroundStyle(Color.white)
    }
    var humidity: some View {
        BackgroundView(title: "HUMIDITY", iconName: "humidity") {
            VStack(alignment: .leading) {
           Text("73 %")
                    .font(.system(size: 35))
           Text("The dew point is 16° right now.")
                    .font(.system(size: 17))
                    .padding(.bottom, 8)
            }
            .padding(.bottom, 11)
        }
        .foregroundStyle(Color.white)
    }
    var body: some View {
        VStack(spacing: 10) {
            airQuality
            temperature
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                GridRow {
                    uvIndexView
                    sunRise
                }
                GridRow {
                    wind
                    rainFall
                }
                GridRow {
                    feelsLike
                    humidity
                }
            }
            Spacer()
        }
        .padding([.leading, .trailing], 10)
    }
}

#Preview {
    ZStack {
        Color.blue
        ScrollView {
            OtherComponents()
        }
    }
}

