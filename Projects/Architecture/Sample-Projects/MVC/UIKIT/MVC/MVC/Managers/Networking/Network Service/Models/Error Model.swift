//
//  Error Model.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 20/03/2024.
//

import Foundation
protocol CustomError: Error {
    var domain: String { get }
    var errorCode: Int { get }
    var message: String { get }
}
