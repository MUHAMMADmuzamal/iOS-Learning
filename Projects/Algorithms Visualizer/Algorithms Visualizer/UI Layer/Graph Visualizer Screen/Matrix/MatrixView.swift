//
//  MatrixView.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct MatrixView: View {
    @StateObject var matrixVM = MatrixVM(visualizeStrategy: BreathFirstSearchStrategy())
    @Binding var selectedNode: NodesEnum
    @State private var visualize: Bool = false
    var body: some View {
        VStack {
            Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 0) {
                ForEach(matrixVM.matrix.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(matrixVM.matrix[rowIndex].indices, id: \.self) { colIndex in
                            getNodeView(matrixVM.matrix[rowIndex][colIndex])
                                .animation(.easeIn(duration: 1.0), value: matrixVM.matrix[rowIndex][colIndex])
//                                .onTapGesture {
//                                    cellDidTap(on: (rowIndex, colIndex), newNode: selectedNode)
//                                }
                                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                                    .onEnded({ value in
                                                        cellDidTap(on: (rowIndex, colIndex), newNode: selectedNode)
                                                    }))
                        }
                    }
                }
            }
            Button {
                if visualize == false {
                    visualize = true
                }
                if visualize {
                    Task {
                        await matrixVM.visualize(start: 
                            (matrixVM.startNodeLocation.row, matrixVM.startNodeLocation.col)) {
                            visualize = false
                        }
                    }
                }
             
            } label: {
                Rectangle()
                    .frame(height: 50)
                    .foregroundStyle(visualize ? Color.red : Color.green)
                    .overlay {
                        Text("Visualize")
                            .font(.title)
                            .bold()
                            .foregroundStyle(Color.white)
                    }
            }

        }
    }
    
    func getNodeView(_ value: Int) -> some View {
        let nodeEnum = NodesEnum(rawValue: value)
        switch nodeEnum {
        case .startNode:
            return Node(model: StartNode(borderColor: .borderColor))
        case .targetNode:
            return Node(model: TargetNode(borderColor: .borderColor))
        case .visitedNode1:
            return Node(model: VisitedNode1(borderColor: .borderColor))
        case .visitedNode2:
            return Node(model: VisitedNode2(borderColor: .borderColor))
        case .unVisitedNode:
            return Node(model: UnVisitedNode(borderColor: .borderColor))
        case .shortestPathNode:
            return Node(model: ShortestPathNode(borderColor: .borderColor))
        case .none:
            return Node(model: UnVisitedNode(borderColor: .borderColor))
        case .wallNode:
            return Node(model: WallNode(borderColor: .borderColor))
        case .bombNode:
            return Node(model: BombNode(borderColor: .borderColor))
        case .weightNode:
            return Node(model: WeightNode(borderColor: .borderColor))
        }
    }
    
    func cellDidTap(on location: (row:Int, col: Int), newNode: NodesEnum){
        let node = NodesEnum(rawValue: self.matrixVM.matrix[location.row][location.col])
        if node != .startNode && node != .targetNode {
            self.matrixVM.addNode(row: location.row, col: location.col, node: newNode)
        }
    }
}

#Preview {
    MatrixView( selectedNode: .constant(.wallNode))
}
