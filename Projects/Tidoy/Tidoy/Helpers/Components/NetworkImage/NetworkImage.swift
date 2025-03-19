//
//  NetworkImage.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI

struct NetworkImage<Loader: ImageLoader>: View {
    let url: URL
    let imageLoader: Loader

    var body: some View {
        imageLoader.loadImage(from: url)
    }
}


#Preview {
    NetworkImage(
        url: URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg")!,
        imageLoader: KingfisherImageLoader()
    )
    .scaledToFit()
}



