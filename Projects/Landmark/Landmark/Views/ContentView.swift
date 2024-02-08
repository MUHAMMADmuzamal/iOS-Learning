//
//  ContentView.swift
//  Landmark
//
//  Created by Codes Orbit on 08/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
