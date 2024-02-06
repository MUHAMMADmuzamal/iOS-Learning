//
//  AsyncImageBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 25/01/2024.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    let url = URL(string: "https://picsum.photos/400")
    var body: some View {
        VStack {
            AsyncImage(url: url)
            AsyncImage(url: url) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            AsyncImage(url:  URL(string: "https://picsum"), content: { phase in
                switch phase {
                case.empty:
                    ProgressView()
                case.success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                default:
                    Text("not found image")
                }
            })
        }
    }
}

#Preview {
    AsyncImageBootcamp()
}
