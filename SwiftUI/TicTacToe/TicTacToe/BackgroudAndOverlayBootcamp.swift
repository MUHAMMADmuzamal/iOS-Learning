//
//  BackgroudAndOverlayBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 20/09/2023.
//

import SwiftUI

struct BackgroudAndOverlayBootcamp: View {
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ////            .frame(width: 100, height: 100, alignment: .center) //here or in circle boat are good
        //            .background(
        ////                Color.red
        ////                LinearGradient(colors: [.red,.green], startPoint: .leading, endPoint: .trailing)
        //                Circle()
        ////                    .fill(Color.blue)
        //                    .fill(LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        //                    .frame(width: 100, height: 100, alignment: .center)
        //            )
        ////            .frame(width: 120, height: 120, alignment: .center) // here or in circle both are good
        //            .background(
        //                Circle()
        ////                    .fill(Color.red)
        //                    .fill(LinearGradient(colors: [.blue,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
        //                    .frame(width: 120, height: 120, alignment: .center)
        //                )
        
        //        Circle()
        //            .fill(Color.pink)
        //            .frame(width: 100, height: 100, alignment: .center)
        //            .overlay(
        //                Text("1").font(.largeTitle).foregroundColor(.white))
        //            .background(Circle().fill(Color.purple).frame(width: 110, height: 110, alignment: .center))
        //        Rectangle()
        //            .frame(width: 100, height: 100)
        //            .overlay(
        //                Rectangle()
        //                    .fill(Color.blue)
        //                    .frame(width: 50, height: 50),
        //                alignment: .topLeading)
        //            .background(
        //                Rectangle()
        //                .fill(Color.red)
        //                .frame(width: 150, height: 150),
        //                        alignment:.bottomTrailing)
        Image(systemName:"heart.fill")
            .font(.system(size:40))
            .foregroundColor(Color.white)
            .background(
                Circle()
                .fill(Color.blue)
                .frame(width:100,height:100)
                .shadow(color: .red, radius: 10, x: 0, y: 10)
                .overlay(
                    Circle()
                        .fill(Color.red)
                        .frame(width: 35, height: 35)
                        .overlay(Text("1").foregroundColor(.white))
                        .shadow(color: .yellow, radius: 10, x: 0, y: -10)
                        
                    ,alignment: .bottomTrailing
                ))
    }
}

struct BackgroudAndOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroudAndOverlayBootcamp()
    }
}
