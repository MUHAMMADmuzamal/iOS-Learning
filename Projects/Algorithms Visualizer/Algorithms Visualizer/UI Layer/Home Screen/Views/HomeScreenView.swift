//
//  HomeScreen.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 02/04/2024.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationSplitView {
            List(HomeScreenModel.dataSource.data) { sections in
                ForEach(sections.subSection ?? []) { section in
                    Section(header: Text(section.sectionTitle)) {
                        ForEach(section.sectionRows) { row in
                            NavigationLink {
                                GraphVisualizerScreenView()
                                } label: {
                               AlgorithmListRow(model: row)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Algorithms Visualizer"))
        } detail: {
               Text("Select a Algorithm")
           }
    }
}

#Preview {
    HomeScreenView()
}
