//
//  HomeAPIService.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
// Get Weather Data API
struct GetWeatherDataAPI: APITarget {
    var baseURL: String
    var path: String
    var headers: [String: String]?
    var method: HTTPMethod
    var bodyParams: Data?
    var queryParams: [URLQueryItem]?
    init() {
        baseURL = .baseUrl
        path = "forecast"
        headers = ["Content-type": "application/json"]
        method = .GET
        bodyParams = nil
        queryParams = [
            "latitude": 33.7215,
            "longitude": 73.0433,
            "current": "temperature_2m"
        ].getQueryItems()
    }
}
