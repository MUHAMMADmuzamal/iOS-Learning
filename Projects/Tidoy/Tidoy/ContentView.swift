//
//  ContentView.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Hello")
                .font(.custom("Manrope", size: 30))
                .fontWeight(.bold)
                .foregroundStyle(.successMain)   
            
            Text("Hello")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.successMain)
        }
            
    }
}

#Preview {
    ContentView()
}
