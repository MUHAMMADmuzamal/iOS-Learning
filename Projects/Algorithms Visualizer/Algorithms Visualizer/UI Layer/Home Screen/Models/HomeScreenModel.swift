//
//  HomeScreenModel.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 02/04/2024.
//

import SwiftUI

struct HomeScreenModel {
    let data: [Sections]
}

struct Sections: Identifiable {
    var id: String = UUID().uuidString
    let sectionTitle: String
    let sectionRows: [SectionRow]
    let subSection: [Sections]?
}

struct SectionRow: Identifiable {
    var id: String = UUID().uuidString
    let rowImage: String
    let rowTitle: String
    let navigateTo: any View
}

extension HomeScreenModel {
    var dataSource: HomeScreenModel {
        HomeScreenModel(data: [
            Sections(sectionTitle: "Graph", sectionRows: [], subSection: [
                Sections(sectionTitle: "Weighted", sectionRows: [
                    SectionRow(rowImage: "A*-icon", rowTitle: "A*", navigateTo: GraphVisualizerScreen())
                    ], subSection: nil),
                Sections(sectionTitle: "Non Weighted", sectionRows: [
                    SectionRow(rowImage: "dfs-icon", rowTitle: "DFS", navigateTo: GraphVisualizerScreen())
                    ], subSection: nil)
            ])
        ])
    }
}
