//
//  GradientsBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 14/09/2023.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //Color.red
//                LinearGradient(colors: [Color(#colorLiteral(red: 0, green: 0.9914229512, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.4790760875, blue: 0.6649770737, alpha: 1))],
//                               startPoint: .topLeading,
//                               endPoint: .bottom)
//                RadialGradient(colors:[Color(#colorLiteral(red: 0, green: 0.9914229512, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.4790760875, blue: 0.6649770737, alpha: 1))], //[Color.red, Color.blue],
//                               center: .topLeading,
//                               startRadius: 5,
//                               endRadius: 400)
                AngularGradient(colors: [Color(#colorLiteral(red: 0, green: 0.9914229512, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.4790760875, blue: 0.6649770737, alpha: 1))],
                                center: .topLeading,
                                angle:.degrees(180 + 45))
            )
            .frame(width: 300, height: 200, alignment: .center)
    }
}

struct GradientsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientsBootcamp()
    }
}
