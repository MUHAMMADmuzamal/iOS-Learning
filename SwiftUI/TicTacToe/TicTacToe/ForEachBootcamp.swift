//
//  ForEachBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 01/10/2023.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data:[String] = ["One","Two","Three","Four","Five"]
    
    var body: some View {
        VStack{
//            ForEach(0..<10){ index in
//                HStack {
//                    Circle()
//                        .frame(width: 30, height: 30)
//                        .overlay(Text("\(index)").foregroundColor(Color.white))
//                }
//            }
            ForEach(data.indices){ index in
                Text("\(data[index])")
            }
            
            ForEach(data, id: \.self){ value in
                Text("\(value)")
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
