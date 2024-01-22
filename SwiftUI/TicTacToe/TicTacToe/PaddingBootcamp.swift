//
//  PaddingAndSpacerBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 27/09/2023.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        VStack (alignment:.leading){
            Text("Hello, World!")
                .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
            
            Text("This is multiline text alignments bala bala bala bala hello hello hello hi hi hello hello hello helloo  hellooooooooooooooooooooooooooo")
     
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.yellow)
//            .padding(.all,20)
//            .padding(.leading,20)
////            .padding()
////            .frame(width: 100, height: 100, alignment: .center)
//            .background(Color.blue)
//            .padding(.leading,20)
      
        }
        .padding()
        .padding(.vertical,10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color:.red.opacity(0.3),radius: 10,x:0, y:10)
        
//        .background(Color.blue)
//        .padding()
//        .background(Color.red)
//        .padding(.horizontal,10)
//        .background(Color.green)
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
