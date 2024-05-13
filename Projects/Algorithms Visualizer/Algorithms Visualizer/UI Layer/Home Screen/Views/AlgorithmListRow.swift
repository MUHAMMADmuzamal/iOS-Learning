//
//  AlgorithmListRow.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 02/04/2024.
//

import SwiftUI

struct AlgorithmListRow: View {
    let model: SectionRow
    var body: some View {
        HStack(alignment: .center) {
            Text(model.rowTitle)
                .font(.title)
            Spacer()
        }
    }
}

#Preview {
    AlgorithmListRow(model: SectionRow(
        rowImage: "tree",
        rowTitle: "A*",
        strategy: DepthFirstSearchStrategy()))
    .background(Color.red)
    .frame(height: 100)
    .previewLayout(.sizeThatFits)
}
