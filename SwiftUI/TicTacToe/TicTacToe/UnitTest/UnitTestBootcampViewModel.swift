//
//  UnitTestBootcampViewModel.swift
//  TicTacToe
//
//  Created by Codes Orbit on 18/02/2024.
//

import Foundation
class UnitTestBootcampViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    func addItem(item: String) {
        self.dataArray.append(item)
    }
}
