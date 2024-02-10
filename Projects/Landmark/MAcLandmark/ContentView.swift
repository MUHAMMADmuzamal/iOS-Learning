//
//  ContentView.swift
//  MAcLandmark
//
//  Created by Codes Orbit on 10/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured


    enum Tab {
        case featured
        case list
    }


    var body: some View {
        TabView(selection: $selection) {
            LandmarkList(modelData: ModelData())
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
}
