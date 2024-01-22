//
//  TrasitionBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 21/10/2023.
//

import SwiftUI

struct TrasitionBootcamp: View {
    @State var showView: Bool = false
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                Button("Button"){
                    showView.toggle()
                }
                Spacer()
            }
            if showView{
                RoundedRectangle(cornerRadius:30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom))
                //different when come to screen and when leave to screen
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
                    .animation(.easeInOut)
                // this work in case of opacity trasiton
//                    .transition(AnyTransition.opacity.animation(.easeInOut))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
            }

        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct TrasitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TrasitionBootcamp()
    }
}
