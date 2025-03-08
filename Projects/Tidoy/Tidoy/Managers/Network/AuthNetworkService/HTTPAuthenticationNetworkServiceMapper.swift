//
//  HTTPAuthenticationNetworkServiceMapper.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 08/03/2025.
//

import Foundation

final class HTTPAuthenticationNetworkServiceMapper {
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> (data: Data, response: HTTPURLResponse) {
        switch response.statusCode {
        case 401:
            throw APIError.unAuthorized
        default:
            break
        }
        return (data, response)
    }
    
    static func refreshTokenMap(_ data: Data, _ response: HTTPURLResponse) throws -> RefreshTokenResponseDTO {
        switch response.statusCode {
            case 200:
            let response = try JSONDecoder().decode(RefreshTokenResponseDTO.self, from: data)
            return response
        default:
            throw APIError.unAuthorized
        }
    }
}
