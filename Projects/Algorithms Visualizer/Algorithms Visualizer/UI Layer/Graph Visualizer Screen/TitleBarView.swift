//
//  TitleBarView.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct TitleBarView: View {
    @Binding var selectedNode: NodesEnum
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(TitleBarModel().data, id: \.id){ model in
                    TitleBarComponent(model: model)
                        .onTapGesture {
                            switch model.node {
                            case is WallNode:
                                self.selectedNode = .wallNode
                            case is BombNode:
                                self.selectedNode = .bombNode
                            case is WeightNode:
                                self.selectedNode = .weightNode
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
