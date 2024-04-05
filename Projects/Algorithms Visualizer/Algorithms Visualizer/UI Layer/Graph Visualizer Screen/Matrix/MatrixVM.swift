//
//  MatrixVM.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 04/04/2024.
//

import Foundation

enum NodesEnum: Int {
    case startNode = 1, targetNode, visitedNode1, visitedNode2, unVisitedNode, shortestPathNode, wallNode, bombNode, weightNode
    
}

class MatrixVM: ObservableObject {
    @Published var matrix: [[Int]] = Array(repeating: Array(repeating: NodesEnum.unVisitedNode.rawValue, count: 21), count: 51)
    init() {
        matrix[26][7] = NodesEnum.startNode.rawValue
        matrix[26][14] = NodesEnum.targetNode.rawValue
    }
    
    func randomFill(){
        for i in self.matrix.indices {
            for j in matrix[i].indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.matrix[i][j] = Int.random(in: 1...8)
                }
            }
        }
    }
}
