//
//  TitleBarView.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI

struct TitleBarView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(TitleBarModel().data, id: \.id){ model in
                    TitleBarComponent(model: model)
                }
            }
            .padding()
        }
    }
}

#Preview {
    TitleBarView()
}
