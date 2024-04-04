//
//  TitleBarComponent.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct TitleBarComponent: View {
    let model: TitleBarComponentModel
    var body: some View {
        HStack {
            Node(model: model.node)
                .frame(width: 20, height: 20)
            Text(model.text)
        }
    }
}

#Preview {
    TitleBarComponent(model: TitleBarModel().data[0])
}
