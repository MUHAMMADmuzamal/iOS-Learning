//
//  ExtractedBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 07/10/2023.
//

import SwiftUI

struct ExtractedBootcamp: View {
    @State var backgroundColor: Color = .pink

    var body: some View {
        ZStack{
            //background
            backgroundColor
                .ignoresSafeArea()
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View{
        VStack{
            Text("Title")
                .font(.largeTitle)
            Button(){
                buttonPress()
            }label:{
                Text("PRESS ME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            }
        }
    }
    
    func buttonPress()  {
        backgroundColor = .yellow
    }
}

struct ExtractedBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedBootcamp()
    }
}
