//
//  BfsStrategy.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 07/04/2024.
//

import Foundation

class BreathFirstSearchStrategy: AlgorithmStrategy {
    func visualize(matrix: inout [[Int]], start: (Int, Int), endValue: Int, completion: ()->Void) async{
        let rowCount = matrix.count
        guard rowCount > 0 else { return }
        let colCount = matrix[0].count
        guard colCount > 0 else { return }
        
        // Define directions: Up, Down, Left, Right
        let directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]
        
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        
        var queue = [(Int, Int)]()
        queue.append(start)
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            do {
                try await Task.sleep(nanoseconds: UInt64(0.01 * Double(NSEC_PER_SEC)))
            } catch {
                print("error")
            }
            let current = queue.removeFirst()
            let currentValue = matrix[current.0][current.1]
            if currentValue == endValue {
                completion()
                return
            }
            // Update matrix value here
            matrix.updateMatrix(matrix: &matrix, row: current.0, col: current.1)
            
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
        completion()
    }
}
