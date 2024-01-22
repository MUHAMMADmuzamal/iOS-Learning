//
//  ColorBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 13/09/2023.
//

import SwiftUI

struct ColorBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                Color.primary
//                Color(UIColor(_colorLiteralRed: 1, green: 1, blue: 0, alpha: 1))
//                Color(UIColor.secondarySystemBackground)
//                Color(#colorLiteral(red:z 0.1506883018, green: 0.2050894863, blue: 1, alpha: 1)) // Edit->Format->Color->drag and drop color
                Color("CustomColor")
            )
            .frame(width: 300.0, height: 200.0)
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -10, y: -20)
//            .shadow(radius: 10)
            
    }
}

struct ColorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorBootcamp()
    }
}
