//
//  Tile.swift
//  GameTicTacToe
//
//  Created by Codes Orbit on 16/02/2024.
//

import Foundation
import SwiftUI

protocol CellProtocol {
    var tile: String { get }
    var displayColor: Color { get }
}

struct NoughtCell: CellProtocol {
    var tile: String = "O"
    var displayColor: Color = .blue
}

struct CrossCell: CellProtocol {
    var tile: String = "X"
    var displayColor: Color = .red
}

struct EmptyCell: CellProtocol {
    var tile: String = ""
    var displayColor: Color = .black
}
