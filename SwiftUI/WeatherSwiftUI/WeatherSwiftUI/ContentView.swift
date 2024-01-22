//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by codes orbit on 31/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State var username:String = ""
    var body: some View {
        VStack {
            TextField("Username", text: $username)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
