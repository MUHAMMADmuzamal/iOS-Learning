//
//  ImagesBootcamp.swift
//  TicTacToe
//
//  Created by codes orbit on 16/09/2023.
//

import SwiftUI

struct ImagesBootcamp: View {
    var body: some View {
//        Image("image1")
//            .resizable()
//            .scaledToFill()
//            .scaledToFit()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 300, height: 200, alignment: .center)
//            .clipShape(
//                Circle()
//                RoundedRectangle(cornerRadius: 25)
//                Ellipse()
//            )
//            .cornerRadius(150)
//            .clipped()
        
        // icon and use png images
        Image("png")
//            .renderingMode(.template) changed from inspector in assest folder and select image and set rendore mode to template
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300, alignment: .center)
            .foregroundColor(.green)
    }
}

struct ImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImagesBootcamp()
    }
}
