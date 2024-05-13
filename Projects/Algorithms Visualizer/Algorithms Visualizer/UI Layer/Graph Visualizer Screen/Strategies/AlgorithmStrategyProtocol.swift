//
//  AlgorithmStrategyProtocl.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 07/04/2024.
//

import Foundation
protocol AlgorithmStrategy {
    func visualize(matrix: inout [[Int]], start: (Int, Int), endValue: Int, completion: () -> Void) async
}
