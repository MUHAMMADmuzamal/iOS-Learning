//
//  SafeareaBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 04/10/2023.
//

import SwiftUI

struct SafeareaBootcamp: View {
    var body: some View {
        ZStack {
//            Color.blue
//                .ignoresSafeArea(.all)
            ScrollView{
                VStack {
                    Text("Title goes here")
                        .font(.largeTitle)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    ForEach(0..<10){ index in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(height:150)
                            .shadow(radius:10)
                            .padding(20)
                    }
                }
            }
//            .background(.blue)
            .background(
                Color.red
                    .ignoresSafeArea()
            )
        }
        
//        ZStack {
//            //background
//
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//            //foreground
//            VStack {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Spacer()
//            }
//            .frame( maxWidth: .infinity, maxHeight:.infinity)
//            .background(.red)
//        }
            
    }
}

struct SafeareaBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeareaBootcamp()
    }
}
