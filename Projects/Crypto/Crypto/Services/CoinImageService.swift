//
//  CoinImageService.swift
//  Crypto
//
//  Created by Codes Orbit on 15/09/2024.
//

import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManger = LocalFileManager.instance
    private let folderName: String = "coin_Images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage =  fileManger.getImage(imageName: imageName, folderName: folderName) {
            self.image = savedImage
        }else {
            self.downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: self.coin.image) else { return }
        
        imageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnImage) in
                guard let self =  self, let downloadImage = returnImage else { return }
                self.image = downloadImage
                self.imageSubscription?.cancel()
                self.fileManger.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
