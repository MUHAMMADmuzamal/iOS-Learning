//
//  SafeAreaInsightBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 03/02/2024.
//

import SwiftUI

struct SafeAreaInsightBootcamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Bootcamp")
//            .overlay(
//                Text("HI")
//                    .frame(maxWidth: .infinity)
//                    .background(Color.yellow),
//                alignment: .bottom
//            )
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                Text("HI")
                    .frame(width: 50, height: 50)
//                   .frame(maxWidth: .infinity)
                   .background(Color.yellow)
                   .clipShape(Circle())
                   .padding()
                
            }
        }
    }
}

#Preview {
    SafeAreaInsightBootcamp()
}
