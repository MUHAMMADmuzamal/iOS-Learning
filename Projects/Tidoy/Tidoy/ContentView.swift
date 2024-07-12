//
//  ContentView.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
 
    var body: some View {
        VStack {
            Text("Hello - \(index)")
            
            Button(action: {
                index += 1
            }, label: {
                Text("Add Plus one to index")
            })
            TextView(index: $index)
                
        }
    }
}

struct TextView: View {
    @Binding var index: Int
    var body: some View {
        Text("Sub View \(index)")
        Button(action: {
            index += 1
        }, label: {
            Text("sub view button")
        })
    }
}

#Preview {
    ContentView()
}
