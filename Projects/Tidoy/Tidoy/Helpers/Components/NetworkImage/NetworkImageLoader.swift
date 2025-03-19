//
//  NetworkImageVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 19/03/2025.
//

import SwiftUI
import Kingfisher

@MainActor
protocol ImageLoader {
    associatedtype ImageView: View
    func loadImage(from url: URL) -> ImageView
}


struct KingfisherImageLoader: ImageLoader {
    
    func loadImage(from url: URL) -> some View {
        KFImage(url)
            .resizable()
            .placeholder {
                ProgressView()
            }
        
    }
}

struct DefaultImageLoader: ImageLoader {
    func loadImage(from url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

//private struct ImageLoaderKey: EnvironmentKey {
//    static let defaultValue: any ImageLoader = KingfisherImageLoader()
//}
//
//extension EnvironmentValues {
//    var imageLoader: any ImageLoader {
//        get {
//            self[ImageLoaderKey.self]
//        } set {
//            self[ImageLoaderKey.self] = newValue
//        }
//    }
//}
