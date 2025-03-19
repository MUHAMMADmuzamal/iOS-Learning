//
//  NetworkImage.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI

struct NetworkImage: View {
    let url: URL
    @Environment(\.imageLoader) private var imageLoader

    var body: some View {
        AnyView(imageLoader.loadImage(from: url))
    }
}


#Preview {
    NetworkImage(
        url: URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg")!
    )
    .scaledToFit()
    .environment(\.imageLoader, KingfisherImageLoader())
}



