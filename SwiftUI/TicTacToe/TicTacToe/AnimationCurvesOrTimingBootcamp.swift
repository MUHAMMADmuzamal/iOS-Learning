//
//  AnimationCurves:Timing.swift
//  TicTacToe
//
//  Created by Codes Orbit on 15/10/2023.
//

import SwiftUI

struct AnimationCurvesTiming: View {
    @State var  isAnimating: Bool = false
    let timing: Double = 10
    var body: some View {
        VStack{
            Button("Button"){
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width:isAnimating ? 350 : 50, height: 100)
                .animation(Animation.spring(
                    response: 0.5,
                    dampingFraction: 0.7,
                    blendDuration: 1.0))
//                .animation(Animation.spring())
                
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width:isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.linear(duration: timing))
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width:isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeIn(duration: timing))
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width:isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeInOut(duration: timing))
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width:isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeOut(duration: timing))
        }
    }
}

struct AnimationCurvesTimingPreviews: PreviewProvider {
    static var previews: some View {
        AnimationCurvesTiming()
    }
}
