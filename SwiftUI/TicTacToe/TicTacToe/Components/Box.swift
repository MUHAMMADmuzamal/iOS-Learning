//
//  Line.swift
//  TicTacToe
//
//  Created by codes orbit on 27/08/2023.
//

import SwiftUI

struct Box: View {
    let size:CGFloat
    let color:Color
    var body: some View {
        Rectangle()
            .size(width: size, height: size)
            .fill(color)
            
    }
}

struct Box_Previews: PreviewProvider {
    static var previews: some View {
        Box(size: 100, color: Color.green)
    }
}
