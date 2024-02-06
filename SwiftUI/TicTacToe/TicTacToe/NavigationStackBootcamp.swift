//
//  NavigationStackBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    let fruits: [String] = ["Apple", "Orange", "Banana"]
    @State var stackPath: [String] = []
    var body: some View {
//        NavigationStack {
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 40) {
                    Button("Super segue!"){
                        stackPath.append(contentsOf: ["coconut", "mango", "cheeku"])
                    }
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit, label: {
                            Text(fruit)
                        })
                    }
                    ForEach(1..<10) { screen in
                        NavigationLink(value: screen, label: {
                            Text("Screen \(screen)")
                        })
    //                    NavigationLink("Screen \(screen)", destination: {
    //                        MySecondScreen(value: screen)
    //                    })
                    }
                }
                .navigationTitle("Nav Bootcamp")
                .navigationDestination(for: Int.self, destination: { value in
                    MySecondScreen(value: value)
            })
                .navigationDestination(for: String.self, destination: { value in
                    Text("FruitScreen \(value)")
            })
            }
        }
    }
}

struct MySecondScreen: View {
    let value: Int
    init(value: Int) {
        self.value = value
        print("INIT Screen \(value)")
    }
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    NavigationStackBootcamp()
}
