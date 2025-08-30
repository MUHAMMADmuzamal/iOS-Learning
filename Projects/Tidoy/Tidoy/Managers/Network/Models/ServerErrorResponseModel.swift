//
//  ServerErrorResponseModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/02/2025.
//

import Foundation

struct ServerErrorResponse: Codable {
    let status: Int?
    let error: String?
    let message: String?
    let details: [String]?
    
    init(status: Int, error: String?, message: String?, details: [String]?) {
        self.status = status
        self.error = error
        self.message = message
        self.details = details
    }
    
    init(error: String?, message: String?) {
        self.status = nil
        self.error = error
        self.message = message
        self.details = nil
    }
}
