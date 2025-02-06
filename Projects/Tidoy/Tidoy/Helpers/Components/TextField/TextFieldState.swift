//
//  TextFieldState.swift
//  Tidoy
//
//  Created by Codes Orbit on 04/02/2025.
//

import SwiftUI

enum StateOfTextField {
    case defaultState, hover, focus, fill, disable, error
    
    var labelColor: Color {
        switch self {
        case .error:
            return .red
        default:
            return .black
        }
    }
    
    var textColor: Color {
        switch self {
        case .defaultState, .hover, .disable:
            return .gray
        case .focus, .fill:
            return .black
        case .error:
            return .red
        }
    }
    
    var borderColor: Color {
        switch self {
        case .defaultState, .fill, .disable:
            return .gray
        case .hover:
            return .blue
        case .focus:
            return .green
        case .error:
            return .red
        }
    }
}
