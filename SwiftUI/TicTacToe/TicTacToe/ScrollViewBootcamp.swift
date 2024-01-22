//
//  ScrollViewBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 02/10/2023.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            //VStack - load all data at a time
            //LazyVStack - load data that show only screen or when needed like if there is 100 images to show than 
            //it show or load data that need at that time of fit on screen. make app more efficient. 
            LazyVStack {
                ForEach(0..<10){ index in
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<20){ index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width:200, height:150)
                                    .shadow(radius: 10)
                                .padding()
                            }
                        }
                    }
                }
            }
        }
//            ScrollView(.vertical, showsIndicators: true){
//            VStack {
//
//                ForEach(0..<50){ index in
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(height:300)
//                        .overlay(Text("\(index)"))
//                }
//            }
//        }
//        ScrollView(.horizontal, showsIndicators: false){
//            HStack {
//
//                ForEach(0..<50){ index in
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(width:300,height:300)
//                        .overlay(Text("\(index)"))
//                }
//            }
//        }
//        ScrollView{
//            VStack {
//
//                ForEach(0..<50){ index in
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(height:300)
//                        .overlay(Text("\(index)"))
//                }
//            }
//        }
 
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
