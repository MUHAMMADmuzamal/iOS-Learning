//
//  GroupBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 03/02/2024.
//

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello World")
            Group {
                Text("Hello World")
                Text("Hello World")
            }
            .foregroundStyle(Color.green)
            .font(.caption)
        }
        .foregroundStyle(Color.red)
        .font(.title)
    }
}

#Preview {
    GroupBootcamp()
}
