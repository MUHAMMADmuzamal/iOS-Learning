//
//  MatrixView.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct MatrixView: View {
    @StateObject var matrixVM = MatrixVM()
    var body: some View {
        VStack(spacing: 0) {
            ForEach(matrixVM.matrix.indices, id: \.self) { rowIndex in
                HStack(spacing: 0) {
                    ForEach(matrixVM.matrix[rowIndex].indices, id: \.self) { colIndex in
                        getNodeView(matrixVM.matrix[rowIndex][colIndex])
                            .onTapGesture {
                                cellDidTap(on: (rowIndex, colIndex), newNode: .wallNode)
                            }
                    }
                }
            }
        }
    }
    
    func getNodeView(_ value: Int) -> some View {
        let nodeEnum = NodesEnum(rawValue: value)
        switch nodeEnum {
        case .startNode:
            return Node(model:  StartNode(borderColor: .borderColor))
        case .targetNode:
            return Node(model:  TargetNode(borderColor: .borderColor))
        case .visitedNode1:
            return Node(model:  VisitedNode1())
        case .visitedNode2:
            return Node(model:  VisitedNode2())
        case .unVisitedNode:
            return Node(model:  UnVisitedNode())
        case .shortestPathNode:
            return Node(model:  ShortestPathNode())
        case .none:
            return Node(model:  UnVisitedNode())
        case .wallNode:
            return Node(model:  WallNode())
        case .bombNode:
            return Node(model:  BombNode())
        }
    }
    
    func cellDidTap(on location: (x:Int, y: Int), newNode: NodesEnum){
        let node = NodesEnum(rawValue: self.matrixVM.matrix[location.x][location.y])
        if node != .startNode && node != .targetNode {
            self.matrixVM.matrix[location.x][location.y] = newNode.rawValue
        }
    }
}

#Preview {
    MatrixView()
}
