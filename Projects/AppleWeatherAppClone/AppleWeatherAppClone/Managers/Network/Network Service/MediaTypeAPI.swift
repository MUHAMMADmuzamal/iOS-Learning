//
//  MediaTypeAPI.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
enum HTTPHeadersKey: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
    case contentDisposition = "Content-Disposition"
    case contentLength = "Content-Length"
    case applicationId = "X-Parse-Application-Id"
    case restApiKey = "X-Parse-REST-API-Key"
}

enum MediaType {
    case video
    case image
}
