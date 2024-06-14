//
//  ContentView.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("apple")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
