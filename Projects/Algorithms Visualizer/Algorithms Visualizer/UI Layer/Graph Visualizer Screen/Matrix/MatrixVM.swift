//
//  MatrixVM.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 04/04/2024.
//

import SwiftUI

enum NodesEnum: Int {
    case startNode = 1,
         targetNode,
         visitedNode1,
         visitedNode2,
         unVisitedNode,
         shortestPathNode,
         wallNode,
         bombNode,
         weightNode
}

class MatrixVM: ObservableObject {
    @Published var matrix: [[Int]] = Array(repeating: 
                                    Array(repeating: NodesEnum.unVisitedNode.rawValue, count: 21), count: 51)
    var startNodeLocation: (row: Int, col: Int) = (row: 25, col: 7)
    var targetNodeLocation: (row: Int, col: Int) = (row: 25, col: 14)
    var visualizeStrategy: AlgorithmStrategy
    
    init(visualizeStrategy: AlgorithmStrategy) {
        self.visualizeStrategy = visualizeStrategy
        matrix[startNodeLocation.row][startNodeLocation.col] = NodesEnum.startNode.rawValue
        matrix[targetNodeLocation.row][targetNodeLocation.col] = NodesEnum.targetNode.rawValue
    }
    func addNode(row: Int, col: Int, node: NodesEnum) {
        if node == .startNode {
            matrix[startNodeLocation.row][startNodeLocation.col] = NodesEnum.unVisitedNode.rawValue
            startNodeLocation = (row, col)
        } else if node == .targetNode {
            matrix[targetNodeLocation.row][targetNodeLocation.col] = NodesEnum.unVisitedNode.rawValue
            targetNodeLocation = (row, col)
        }
        matrix[row][col] = node.rawValue
    }
    
    func visualize(start: (Int, Int), completion: () -> Void) async {
        await self.visualizeStrategy.visualize(matrix: &matrix, start:
            (start.0, start.1), endValue: NodesEnum.targetNode.rawValue,
            completion: completion)
    }
}
