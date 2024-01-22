//
//  ContentView.swift
//  TicTacToe
//
//  Created by codes orbit on 26/08/2023.
//

import SwiftUI

struct ContentView: View {
    //component variables
    
    let height:CGFloat      = 300.0
    let width:CGFloat       = 300.0
    let boxSize:CGFloat     = 100.0
    let boxColor: Color     = Color.black
    
    @State var count = 0
    var body: some View {
        VStack {
            ZStack{
                VStack {
                    ForEach(0..<3, id:\.self){ item in
                        HStack{
                            ForEach(0..<3,id:\.self){ item1 in
                                Box(size: boxSize, color: boxColor)
                                    .onTapGesture(count: 1) {
                                        count += 1
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.red)
            .frame(width: width, height: height, alignment: .center)
            Text("Count: \(count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
