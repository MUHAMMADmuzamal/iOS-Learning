//
//  CountryListModel.swift
//  Tidoy
//
//  Created by Codes Orbit on 21/08/2024.
//

import Foundation

struct CountryModel: Hashable {
    let name: String
    let code: String
    let flag: String
}

extension CountryModel {
    static let defaultCountry = CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰")
}
