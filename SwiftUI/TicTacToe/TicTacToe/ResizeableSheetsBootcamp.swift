//
//  ResizeableSheetsBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct ResizeableSheetsBootcamp: View {
    @State var showSheet: Bool = false
    @State var detents: PresentationDetent = .large
    var body: some View {
        Button("Click me") {
            showSheet.toggle()
        }.sheet(isPresented: $showSheet, content: {
            MySheet(detents: $detents)
                .presentationDetents([.large, .medium], selection: $detents)
//                .presentationDetents([.height(100), .medium, .large])
//                .presentationDetents([.fraction(0.2), .medium, .large])
//                .presentationDetents([.medium, .large])
//                .interactiveDismissDisabled()
//                .presentationDragIndicator(.hidden)
        })
    }
}

struct MySheet: View {
    @Binding var detents: PresentationDetent
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Button("Medium") {
                    detents = .medium
                }
                Button("Large") {
                    detents = .large
                }
            }
        }
    }
}

#Preview {
    ResizeableSheetsBootcamp()
}
