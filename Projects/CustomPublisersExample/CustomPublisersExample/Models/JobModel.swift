//
//  JobModel.swift
//  CustomPublisersExample
//
//  Created by Codes Orbit on 27/03/2024.
//

import Foundation
struct JobModel: Identifiable {
    typealias ID = String
    let id: String
    let company: String
    let title: String
}

extension JobModel: Codable { }
