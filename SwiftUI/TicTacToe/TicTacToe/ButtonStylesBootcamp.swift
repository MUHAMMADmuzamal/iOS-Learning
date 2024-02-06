//
//  ButtonStylesBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
        VStack {
            
            Button(action: {}, label: {
                Text("Button")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            })
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .buttonStyle(.borderedProminent)
            Button("Button") {
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
//            .buttonStyle(.plain)
            .buttonStyle(.borderedProminent)
            Button("Button") {
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.regular)
//            .buttonStyle(.bordered)
            .buttonStyle(.borderedProminent)
            Button("Button") {
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.small)
            .buttonStyle(.borderedProminent)
            Button("Button") {
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
//            .buttonStyle(.borderless)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ButtonStylesBootcamp()
}
