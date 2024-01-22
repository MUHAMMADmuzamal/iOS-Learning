//
//  StacksBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 26/09/2023.
//

import SwiftUI

struct StacksBootcamp: View {
    var body: some View {
        //VStack -> Vertical
        //HStack -> Horizontal
        //ZStack -> zIndex(back to front)
        
        VStack (spacing: 50){
            ZStack{
                Circle()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("1")
                    .foregroundColor(Color.white)
            }
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(Circle().frame(width: 100, height: 100))
        }
//        VStack(alignment: .center, spacing:20){
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//            Text("item in yours carts")
//                .font(.caption)
//                .foregroundStyle(Color.red)
//
//        }
        
        
//        ZStack(alignment: .top){
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 350, height: 500, alignment: .center)
//            
//            VStack(alignment:.leading, spacing:30){
//                
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 150, height: 150)
//                
//                Rectangle()
//                    .fill(Color.green)
//                    .frame(width: 100, height: 100)
//                
//                HStack (alignment:.bottom){
//                    
//                    Rectangle()
//                        .fill(Color.purple)
//                    .frame(width: 50, height: 50)
//                    
//                    Rectangle()
//                        .fill(Color.pink)
//                    .frame(width: 75, height: 75)
//                    
//                    Rectangle()
//                        .fill(Color.blue)
//                    .frame(width: 25, height: 25)
//                }
//                .background(Color.white)
//            }
//            .background(Color.black)
//        }
        
        // spacing : 0 to remove spacing in VStack and HStack
//        ZStack(alignment: .bottomTrailing, content:{
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 200, height: 200, alignment: .center)
//            
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 150, height: 150, alignment: .center)
//            
//            Rectangle()
//                .fill(Color.blue)
//                .frame(width: 100, height: 100, alignment: .center)
//        })
    }
}

struct StackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StacksBootcamp()
    }
}
