//
//  SpacerBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 01/10/2023.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) { // if spacing nil then it set to default i think 8 if you want to remove then set to Zero.
                
    //            Spacer(minLength: 0)           .frame(height:10)
    //                .background(Color.orange)
    //
    //            Rectangle()
    //                .frame(width: 50, height: 100, alignment: .center)
    //
    //            Spacer()
    //                .frame(height:10)
    //                .background(Color.orange)
    //
    //            Rectangle()
    //                .fill(Color.red)
    //                .frame(width: 50, height: 100, alignment: .center)
    //
    //            Spacer()
    //                .frame(height:10)
    //                .background(Color.orange)
    //
    //            Rectangle()
    //                .fill(Color.green)
    //                .frame(width: 50, height: 100, alignment: .center)
    //
    //            Spacer(minLength: 0)
    //                .frame(height:10)
    //                .background(Color.orange)
                
                
                Image(systemName: "xmark")
    //                .font(.title)
                Spacer()
                    .frame(height:10)
                    .background(Color.orange)
                Image(systemName: "gear")
    //                .font(.title)
         
            }
            .font(.title)
//            .background(Color.yellow)
    //        .padding(.horizontal,200)
            .padding(.horizontal)
//            .padding(.top)
//        .background(Color.blue)
            
            Spacer()
                .frame(width:10)
                .background(Color.orange)
            Rectangle()
                .frame( height: 55)
        }
//        .background(Color.yellow)
    }
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
