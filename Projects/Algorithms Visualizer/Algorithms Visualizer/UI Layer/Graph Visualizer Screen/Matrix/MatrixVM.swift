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
    @Published var matrix: [[Int]] = Array(repeating: Array(repeating: NodesEnum.unVisitedNode.rawValue, count: 21), count: 51)
    var startNodeLocation: (row: Int, col: Int) = (row: 10, col: 10)
    var targetNodeLocation: (row: Int, col: Int) = (row: 0, col: 1)
    
    func addNode(row: Int, col: Int, node: NodesEnum){
        if node == .startNode {
            matrix[startNodeLocation.row][startNodeLocation.col] = NodesEnum.unVisitedNode.rawValue
            startNodeLocation = (row, col)
        } else if node == .targetNode {
            matrix[targetNodeLocation.row][targetNodeLocation.col] = NodesEnum.unVisitedNode.rawValue
            targetNodeLocation = (row, col)
        }
        matrix[row][col] = node.rawValue
    }
    
    func bfs(start: (Int, Int), endValue: Int = NodesEnum.targetNode.rawValue) async -> (Int, Int)? {
        let rowCount = matrix.count
        guard rowCount > 0 else { return nil }
        let colCount = matrix[0].count
        guard colCount > 0 else { return nil }
        
        // Define directions: Up, Down, Left, Right
        let directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]
        
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        
        var queue = [(Int, Int)]()
        queue.append(start)
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            do{
                try await Task.sleep(nanoseconds: UInt64(0.2 * Double(NSEC_PER_SEC)))
            }catch {
                print("error")
            }
            let current = queue.removeFirst()
            let currentValue = matrix[current.0][current.1]
            if currentValue == endValue {
                return current
            }
            // Update matrix value here
            withAnimation(.bouncy) {
                matrix[current.0][current.1] = NodesEnum.visitedNode1.rawValue // Mark as visited
            }
            
            for dir in directions {
                let newRow = current.0 + dir.0
                let newCol = current.1 + dir.1
                if newRow >= 0 && newRow < rowCount && newCol >= 0 && newCol < colCount
                    && !visited[newRow][newCol] {
                    visited[newRow][newCol] = true
                    queue.append((newRow, newCol))
                }
            }
        }
        
        // If endValue not found, return nil
        return nil
    }
}
