//
//  AnimationUpdatedBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 03/02/2024.
//

import SwiftUI

struct AnimationUpdatedBootcamp: View {
    @State private var animate: Bool = false
    @State private var animate2: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button("Action 1") {
                    animate.toggle()
                }
                Button("Action 2") {
                    animate2.toggle()
                }
                ZStack {
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, 
                               height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                               alignment: animate ? .leading : .trailing)
                        .background(Color.green)
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, 
                               alignment: animate2 ? .bottom : .top)
                        .background(Color.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
            }
        }
        .animation(.spring, value: animate)
        .animation(.linear(duration: 5), value: animate2)
//        .animation(.spring)
    }
}

#Preview {
    AnimationUpdatedBootcamp()
}
