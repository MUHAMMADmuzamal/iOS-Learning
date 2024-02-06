//
//  BackgroundMaterialBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct BackgroundMaterialBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .background(
            Image("image6")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundMaterialBootcamp()
}
