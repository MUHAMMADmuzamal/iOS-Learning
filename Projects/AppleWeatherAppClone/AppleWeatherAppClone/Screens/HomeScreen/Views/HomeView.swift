//
//  HomeView.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 22/02/2024.
//

import SwiftUI

struct HomeView: View {
    var vm: HomeScreenVMProtocol = HomeScreenVM(
        homeRepository: HomeRepository(
            homeNetworkProvider:HomeNetworkProvider()))
    @State var currentWeatherSectionState: CurrentWeatherForecastModel = CurrentWeatherForecastModel(
        cityName: "Seongnam-si",
        temperature: 21,
        weatherType: "Partly Cloudy",
        highTemperature: 29,
        lowTemperature: 15)
    @State var daysForecastRowModelData = [
        DayRowForeCast(temperature: "10",
                       rainPercentage: 27,
                       day: "Mon",
                       minTemperature: 15,
                       maxTemperature: 25,
                       uvIndex: 10,
                       iconName: "cloud.drizzle"),
        DayRowForeCast(temperature: "25",
                       rainPercentage: 7,
                       day: "Tue",
                       minTemperature: 10,
                       maxTemperature: 20,
                       uvIndex: 10,
                       iconName: "cloud.drizzle"),
        DayRowForeCast(temperature: "25",
                       rainPercentage: 7,
                       day: "Wed",
                       minTemperature: 10,
                       maxTemperature: 20,
                       uvIndex: 10,
                       iconName: "cloud.drizzle"),
        DayRowForeCast(temperature: "27",
                       rainPercentage: nil,
                       day: "Thu",
                       minTemperature: 1,
                       maxTemperature: 35,
                       uvIndex: 4,
                       iconName: "sun.max.fill"),
        DayRowForeCast(temperature: "27",
                       rainPercentage: nil,
                       day: "Fri",
                       minTemperature: 1,
                       maxTemperature: 35,
                       uvIndex: 4,
                       iconName: "sun.max.fill"),
        DayRowForeCast(temperature: "27",
                       rainPercentage: nil,
                       day: "Sat",
                       minTemperature: 1,
                       maxTemperature: 35,
                       uvIndex: 4,
                       iconName: "sun.max.fill"),
        DayRowForeCast(temperature: "27",
                       rainPercentage: nil,
                       day: "Sun",
                       minTemperature: 1,
                       maxTemperature: 35,
                       uvIndex: 4,
                       iconName: "sun.max.fill")
    ]
    var body: some View {
        ZStack {
            background
            ScrollView {
                VStack {
                    Spacer(minLength: 73)
                    CurrentWeatherForecast(model: $currentWeatherSectionState)
                    Spacer().frame(height: 44)
                    HourlyForecast()
                    Spacer().frame(height: 8)
                    DaysForeCast(daysForeCastList: $daysForecastRowModelData)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
    var background: some View {
        ZStack {
            LinearGradient(colors: [Color("GradientColor-1"),
                                    Color("GradientColor-2")],
                                    startPoint: .bottom,
                                    endPoint: .top)
            VStack {
                ZStack {
                    Group {
                        Image("cloudImage")
                            .resizable()
                        Image("starsImage")
                            .resizable()
                    }
                .scaledToFit()
                }
                Spacer()
            }
            Rectangle()
                .fill(LinearGradient(
                    colors: [
                        Color(hex: "#1C232B").opacity(0.0),
                        Color(hex: "#1C232B"),
                        Color(hex: "#1C232B"),
                        Color(hex: "#1C232B").opacity(0.0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                )
                .padding(.top, 300)
                .padding(.bottom, 78)
        }.onAppear {
            vm.fetchWeatherData()
        }
    }
}
#Preview {
    HomeView()
}
