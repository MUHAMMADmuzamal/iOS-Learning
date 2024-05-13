//
//  Node.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct Node: View {
    let model: NodeProtocol
    var body: some View {
        Rectangle()
            .stroke(model.borderColor ?? .white, lineWidth: 1.0)
            .background(model.color ?? .white)
            .overlay {
            if model.imageName != nil {
                Image(model.imageName ?? "")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    Node(model: WallNode())
        .padding()
}
