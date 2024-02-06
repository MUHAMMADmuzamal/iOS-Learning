//
//  PopOverBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 03/02/2024.
//

import SwiftUI

struct NativePopOverBootcamp: View {
    @State private var showPopover: Bool = false
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Button("Click") {
                showPopover.toggle()
            }
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.topLeading), content: {
                Text("Hello World")
                    .presentationCompactAdaptation(.popover)
            })
        }
    }
}

#Preview {
    NativePopOverBootcamp()
}
