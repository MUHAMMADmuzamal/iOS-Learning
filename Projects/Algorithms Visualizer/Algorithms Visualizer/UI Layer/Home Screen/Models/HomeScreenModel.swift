//
//  HomeScreenModel.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 02/04/2024.
//

import SwiftUI

protocol AlgorithmStrategy {
    
}
class DepthFirstSearchStrategy: AlgorithmStrategy {
    
}
class AStarStrategy: AlgorithmStrategy {
    
}
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
    let strategy: AlgorithmStrategy
}

extension HomeScreenModel {
    static var dataSource: HomeScreenModel {
        HomeScreenModel(data: [
            Sections(sectionTitle: "Graph", sectionRows: [], subSection: [
                Sections(sectionTitle: "Weighted", sectionRows: [
                    SectionRow(rowImage: "tree", rowTitle: "A Star", strategy: AStarStrategy())
                    ], subSection: nil),
                Sections(sectionTitle: "Non Weighted", sectionRows: [
                    SectionRow(rowImage: "tree", rowTitle: "Depth First Search", strategy: DepthFirstSearchStrategy())
                    ], subSection: nil)
            ])
        ])
    }
}
