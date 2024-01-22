//
//  AnimationBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 11/10/2023.
//

import SwiftUI

struct AnimationBootcamp: View {
    @State var isAnimated: Bool = false
    var body: some View {
        VStack{
            Button("Button"){
                //this is base on variable so every time variable change then animation work
//                withAnimation(
////                    .default
////                      .default.delay(1)
////                    .default.repeatCount(5, autoreverses: true)
////                    .default.repeatForever( autoreverses: true)
//                ) {
                    isAnimated.toggle()
//                }
                
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .green : .blue)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
            // this work every time rectangle changed
                .animation(.default)
            Spacer()
        }
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
