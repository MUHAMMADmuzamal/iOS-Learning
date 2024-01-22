//
//  ConditionalBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 11/10/2023.
//

import SwiftUI

struct ConditionalBootcamp: View {
    @State var showCircle: Bool = true
    var body: some View {
        VStack{
            Button("CirclleButton \(showCircle.description)"){
                showCircle.toggle()
            }
            if !showCircle{
                Circle()
                    .frame(width:100, height:100)
            }
        }
        
    }
}

struct ConditionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootcamp()
    }
}
