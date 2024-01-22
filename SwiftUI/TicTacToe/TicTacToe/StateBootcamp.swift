//
//  StateBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 07/10/2023.
//

import SwiftUI

struct StateBootcamp: View {
    @State var backgroundColor:Color = .green
    @State var myTitle:String = "My Title"
    @State var count:Int = 0
    
    var body: some View {
        ZStack{
            //background
            backgroundColor
                .ignoresSafeArea()
            VStack(spacing:20){
                Text(myTitle)
                    .font(.title)
                Text("Count: \(self.count)")
                    .font(.headline)
                    .underline()
                HStack(spacing:20){
                    Button("Button 1"){
                        backgroundColor = .red
                        myTitle = "Button 1 was Pressed."
                        count += 1
                    }
                    Button("Button 2"){
                        backgroundColor = .purple
                        myTitle = "Button 2 was Pressed."
                        count -= 1
                        
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct StateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StateBootcamp()
    }
}
