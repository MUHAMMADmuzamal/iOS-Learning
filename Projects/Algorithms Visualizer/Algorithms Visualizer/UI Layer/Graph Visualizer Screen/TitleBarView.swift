//
//  TitleBarView.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct TitleBarView: View {
    @Binding var selectedNode: NodesEnum
    @State var tabBarData = TitleBarModel().data
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(tabBarData, id: \.id) { model in
                    TitleBarComponent(model: model)
                        .onTapGesture {
                            for index in tabBarData.indices {
                                if tabBarData[index].id == model.id {
                                    tabBarData[index].isSelected = true
                                } else {
                                    tabBarData[index].isSelected = false
                                }
                            }
                            switch model.node {
                            case is WallNode:
                                self.selectedNode = .wallNode
                            case is BombNode:
                                self.selectedNode = .bombNode
                            case is WeightNode:
                                self.selectedNode = .weightNode 
                            case is StartNode:
                                self.selectedNode = .startNode
                            case is TargetNode:
                                self.selectedNode = .targetNode
                            case is UnVisitedNode:
                                self.selectedNode = .unVisitedNode
                            default:
                                break
                            }
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TitleBarView(selectedNode: .constant(.wallNode))
}
