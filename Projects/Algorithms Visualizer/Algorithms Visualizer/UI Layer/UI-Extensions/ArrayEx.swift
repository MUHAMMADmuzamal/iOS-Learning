//
//  ArrayEx.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 07/04/2024.
//

import Foundation
extension Array {
    func updateMatrix(matrix: inout [[Int]], row: Int, col: Int) {
        let value =  NodesEnum(rawValue: matrix[row][col])
        if value == .unVisitedNode {
            matrix[row][col] = NodesEnum.visitedNode1.rawValue
        }
    }
}
