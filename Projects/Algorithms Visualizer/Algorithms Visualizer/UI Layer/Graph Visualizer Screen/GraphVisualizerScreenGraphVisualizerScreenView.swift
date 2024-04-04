//
//  GraphVisualizerScreen.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 02/04/2024.
//

import SwiftUI

struct GraphVisualizerScreenView: View {
    var body: some View {
        ZStack {
            VStack {
                TitleBarView()
                MatrixView()
            }
        }
        .padding()
    }
}

#Preview {
    GraphVisualizerScreenView()
}
