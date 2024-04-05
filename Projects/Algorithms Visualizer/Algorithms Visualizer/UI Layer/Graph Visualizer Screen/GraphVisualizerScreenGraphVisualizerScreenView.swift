//
//  GraphVisualizerScreen.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 02/04/2024.
//

import SwiftUI

struct GraphVisualizerScreenView: View {
    @State var selectedNode: NodesEnum = .wallNode
    var body: some View {
        ZStack {
            VStack {
                TitleBarView(selectedNode: $selectedNode)
                MatrixView(selectedNode: $selectedNode)
            }
        }
        .padding()
    }
}

#Preview {
    GraphVisualizerScreenView()
}
