//
//  MapScreenVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 28/04/2025.
//

import Foundation

protocol MapScreenVMProtocol: ObservableObject {
    var dataSource: [DefaultCardModel] { get }
    func goBack()
}

class MapScreenVM: MapScreenVMProtocol {
    private var router: MapScreenRouter!
    
    init(router: MapScreenRouter) {
        self.router = router
    }
    
    let dataSource: [DefaultCardModel] = DefaultCardModel.sampleDataList
    
    func goBack() {
        router.goBack()
    }
}
