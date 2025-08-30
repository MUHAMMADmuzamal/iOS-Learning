//
//  FeaturePlacesVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import Foundation

protocol FeaturePlacesScreenVMProtocol: ObservableObject {
    var dataSource: [FeaturedCardModel] { get }
    var rowsForGrid: [[FeaturedCardModel]] { get }
    
    func goBack()
}

class FeaturePlacesScreenVM: FeaturePlacesScreenVMProtocol {
    
    private var router: FeaturePlacesScreenRouterProtocol!
    
    @Published var dataSource: [FeaturedCardModel] = FeaturedCardModel.sampleData
    
    init(router: FeaturePlacesScreenRouterProtocol) {
        self.router = router
    }
    
    var rowsForGrid: [[FeaturedCardModel]] {
        stride(from: 0, to: dataSource.count, by: 2).map { index in
            Array(dataSource[index..<min(index + 2, dataSource.count)])
        }
    }
    
    func goBack() {
        router.goBack()
    }
}
