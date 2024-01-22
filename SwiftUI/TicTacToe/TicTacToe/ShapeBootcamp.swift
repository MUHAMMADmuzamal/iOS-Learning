//
//  ShapeBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 12/09/2023.
//

import SwiftUI

struct ShapeBootcamp: View {
    var body: some View {
        //Circle()
        //Ellipse()
//        Capsule(style: .continuous)
//        Rectangle()
        RoundedRectangle(cornerRadius: 10)
            .trim(from: 0.4, to: 1)
//            .stroke(Color.blue, lineWidth: 25)
//            .stroke(Color.purple, style: StrokeStyle(
//                lineWidth: 5,
//                lineCap: .round,
//                lineJoin: .miter,
//                miterLimit: 0,
//                dash: [5, 10],
//                dashPhase: 0
//            ))
//            .stroke(Color.blue, lineWidth: 20)
//            .fill(Color.red)
           // .foregroundColor(Color.green)
//            .stroke()
            .frame(width: 300.0, height: 200.0)
           
    }
}

struct ShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBootcamp()
    }
}
