//
//  ViewThatFitsBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 03/02/2024.
//

import SwiftUI

struct ViewThatFitsBootcamp: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            ViewThatFits {
                Text("That is some text that i would like to show user!")
                Text("That is some text that i would like to display!")
                Text("That is some text!")
            }
//            Text("That is some text that i would like to show user!")
//                .lineLimit(1)
//                .minimumScaleFactor(0.3)
        }
        .frame(height: 300)
        .padding(16)
        .font(.headline)
        
    }
}

#Preview {
    ViewThatFitsBootcamp()
}
