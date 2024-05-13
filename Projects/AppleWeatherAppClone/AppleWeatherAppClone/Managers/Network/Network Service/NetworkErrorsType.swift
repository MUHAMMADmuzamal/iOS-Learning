//
//  APIService.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
protocol ErrorsType: Error {
    var domain: String { get }
    var code: Int { get }
    var description: String { get }
}

struct NetworkErrors: ErrorsType {
    var domain: String
    
    var code: Int
    
    var description: String
    
}
