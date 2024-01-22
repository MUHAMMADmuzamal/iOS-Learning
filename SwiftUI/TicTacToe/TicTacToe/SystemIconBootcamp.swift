//
//  SystemIconBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 15/09/2023.
//

import SwiftUI

struct SystemIconBootcamp: View {
    var body: some View {
            Image(systemName: "heart.fill")
            .resizable()
            .scaledToFill()
            
//            .scaledToFit()
//            .aspectRatio(contentMode: .fit)
//            .font(.system(size:200))
            .foregroundColor(.red)
            .frame(width: 200, height: 200, alignment: .center)
//            .clipped()
//            .font(.largeTitle)
    }
}

struct SystemIconBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SystemIconBootcamp()
    }
}
