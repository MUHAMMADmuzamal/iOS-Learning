//
//  FrameBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 19/09/2023.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .frame(height: 100, alignment:.topLeading)
            .background(Color.orange)
            .frame(width:150)
            .background(Color.purple)
            .frame(maxWidth:.infinity,alignment:.leading)
            .background(Color.pink)
            .frame(height:400)
            .background(Color.green)
            .frame(maxHeight:.infinity,alignment:.top)
            .background(Color.yellow)
        
//            .frame( maxWidth: .infinity,maxHeight:.infinity, alignment: .leading)
//            .frame( maxWidth: .infinity, alignment: .leading)
//            .frame(width: 300, height: 300, alignment: .leading)
//            .background(Color.red)
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
