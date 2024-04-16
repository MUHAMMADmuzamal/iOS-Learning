//
//  DfsStrategy.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 07/04/2024.
//

import Foundation

class DepthFirstSearchStrategy: AlgorithmStrategy {
    func visualize(matrix: inout [[Int]], start: (Int, Int), endValue: Int, completion: () -> Void) async {
        let rowCount = matrix.count
        guard rowCount > 0 else { return }
        let colCount = matrix[0].count
        guard colCount > 0 else { return }
        
        // Define directions: Up, Down, Left, Right
        let directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]
        
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        
        // Define the DFS function
        func dfs(row: Int, col: Int) {
            visited[row][col] = true
            let currentValue = matrix[row][col]
            if currentValue == endValue {
                completion()
                return
            }
            // Update matrix value here
            matrix[row][col] = -1
            
            for dir in directions {
                let newRow = row + dir.0
                let newCol = col + dir.1
                if newRow >= 0 && newRow < rowCount && newCol >= 0 && newCol < colCount
                    && !visited[newRow][newCol] {
                    dfs(row: newRow, col: newCol)
                }
            }
        }
        
        // Start DFS traversal from the given start point
        dfs(row: start.0, col: start.1)
        
        // If endValue not found, return nil
        completion()
    }
}
