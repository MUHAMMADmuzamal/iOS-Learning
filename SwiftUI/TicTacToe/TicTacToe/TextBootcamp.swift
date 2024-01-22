//
//  TextBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 11/09/2023.
// help link : https://www.youtube.com/watch?v=RKfkG01x79w&list=PLwvDm4VfkdphqETTBf-DdjCoAvhai1QpO&index=3

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello world".uppercased())
        //modifier oder matter
            .baselineOffset(10)// -10 means add line space on top of line
            .kerning(1.0) // space between letters
            .multilineTextAlignment(.leading)
            .foregroundColor(.green)
            .frame(width: 300, height: 300, alignment:.trailing ) // alignment set in side frame
           .minimumScaleFactor(0.1)
//            .font(.body) // automatically adjust size
////            .fontWeight(.semibold)
//            .bold()
//            .italic()
//            .underline(true,color:Color.red)
////            .underline()
////            .strikethrough()
//            .strikethrough(true,color:Color.green)
        
        //size is fixed
//            .font(.system(size: 40,weight:.semibold,design:.monospaced))
            
        
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
