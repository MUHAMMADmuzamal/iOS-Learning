//
//  UnitTestBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 18/02/2024.
//

import SwiftUI

struct UnitTestBootcamp: View {
    @StateObject private var vm: UnitTestBootcampViewModel
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestBootcampViewModel(isPremium: isPremium))
    }
    var body: some View {
        Text(vm.isPremium.description)
    }
}

#Preview {
    UnitTestBootcamp(isPremium: true)
}
