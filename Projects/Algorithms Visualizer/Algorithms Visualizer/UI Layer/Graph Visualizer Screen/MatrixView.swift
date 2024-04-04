//
//  MatrixView.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct MatrixView: View {
    var matrix: [[Int]] = Array(repeating: Array(repeating: 1, count: 22), count: 50)
    
    var body: some View {

        VStack(spacing: 0) {
            ForEach(matrix, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(row, id: \.self) { col in
                            Node(model:  VisitedNode1())
                    }
                }
            }
        }
    }
}

#Preview {
    MatrixView()
}
