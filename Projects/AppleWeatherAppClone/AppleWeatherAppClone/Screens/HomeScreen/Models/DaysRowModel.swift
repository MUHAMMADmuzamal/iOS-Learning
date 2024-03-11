//
//  DaysRowModel.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 24/02/2024.
//

import Foundation

struct DayRowForeCast: Identifiable {
    let id = UUID()
    let temperature: String
    let rainPercentage: Int?
    let day: String
    let minTemperature: Int
    let maxTemperature: Int
    let uvIndex: Int
    let iconName: String
}
