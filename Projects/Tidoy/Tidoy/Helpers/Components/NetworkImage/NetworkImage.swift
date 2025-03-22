//
//  NetworkImage.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI

struct NetworkImage: View {
    let url: String
    @Environment(\.imageLoader) private var imageLoader

    var body: some View {
        if let url = URL(string: url) {
            AnyView(imageLoader.loadImage(from: url))
        }else {
            Image(systemName: "photo.fill")
                .resizable()
        }
        
    }
}


#Preview {
    NetworkImage(url: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg"
    )
    .scaledToFit()
    .environment(\.imageLoader, KingfisherImageLoader())
}



