//
//  GraphVisualizerScreenModels.swift
//  Algorithms Visualizer
//
//  Created by Codes Orbit on 03/04/2024.
//

import SwiftUI
protocol NodeProtocol {
    var imageName: String? {get set}
    var color: Color? {get set}
    var borderColor: Color? {get set}
}

struct StartNode: NodeProtocol {
    var borderColor: Color?
    var imageName: String? = "start-node"
    var color: Color?
}

struct TargetNode: NodeProtocol {
    var borderColor: Color?
    var imageName: String? = "circle"
    var color: Color?
}

struct BombNode: NodeProtocol {
    var borderColor: Color?
    var imageName: String? = "bomb"
    var color: Color?
}

struct WeightNode: NodeProtocol {
    var borderColor: Color?
    var imageName: String? = "weight"
    var color: Color?
}

struct WallNode: NodeProtocol {
    var borderColor: Color?
    var imageName: String?
    var color: Color? = .wallColor
}

struct UnVisitedNode: NodeProtocol {
    var borderColor: Color? = .borderColor
    var imageName: String?
    var color: Color? = .unVisitedColor
}

struct VisitedNode1: NodeProtocol {
    var borderColor: Color?
    var imageName: String?
    var color: Color? = .visited1Color
}

struct VisitedNode2: NodeProtocol {
    var borderColor: Color?
    var imageName: String?
    var color: Color? = .visited2Color
}

struct ShortestPathNode: NodeProtocol {
    var borderColor: Color?
    var imageName: String?
    var color: Color? = .shortestPathColor
}

struct TitleBarComponentModel: Identifiable {
    let id = UUID().uuidString
    let node: NodeProtocol
    let text: String
    var isSelected: Bool = false
}

struct TitleBarModel {
     var data:[TitleBarComponentModel] = [
        TitleBarComponentModel(node: StartNode(), text: "Start Node"),
        TitleBarComponentModel(node: TargetNode(), text: "Target Node"),
        TitleBarComponentModel(node: BombNode(), text: "Bomb Node"),
        TitleBarComponentModel(node: WeightNode(), text: "Weight Node"),
        TitleBarComponentModel(node: UnVisitedNode(), text: "UnVisited Node"),
        TitleBarComponentModel(node: VisitedNode1(), text: ""),
        TitleBarComponentModel(node: VisitedNode2(), text: "Visited Node"),
        TitleBarComponentModel(node: ShortestPathNode(), text: "Shortest-Path Node"),
        TitleBarComponentModel(node: WallNode(), text: "Wall Node"),
    ]
}


