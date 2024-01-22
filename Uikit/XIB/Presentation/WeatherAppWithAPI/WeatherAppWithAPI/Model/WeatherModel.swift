//
//  WeatherModel.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 04/09/2023.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let dailyUnits: DailyUnits
    let daily: Daily

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]
    let temperature2MMax, temperature2MMin: [Double]
    let sunrise, sunset: [String]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case sunrise, sunset
    }
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, temperature2MMax, temperature2MMin, sunrise: String
    let sunset: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case sunrise, sunset
    }
}

