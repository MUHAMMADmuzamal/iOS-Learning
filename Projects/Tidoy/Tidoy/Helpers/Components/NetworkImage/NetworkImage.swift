//
//  NetworkImage.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI

struct NetworkImage<Placeholder: View>: View {
    let url: String
    let placeholder: Placeholder
    @Environment(\.imageLoader) private var imageLoader
    
    init(
          url: String,
          @ViewBuilder placeholder: () -> Placeholder = {
              Image(systemName: "photo.fill").resizable()
          }
      ) {
          self.url = url
          self.placeholder = placeholder()
      }

    var body: some View {
        if let url = URL(string: url) {
            AnyView(imageLoader.loadImage(from: url))
        }else {
            placeholder
        }
    }
}


#Preview {
    NetworkImage(url: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg"
    )
    .scaledToFit()
    .environment(\.imageLoader, KingfisherImageLoader())
}



