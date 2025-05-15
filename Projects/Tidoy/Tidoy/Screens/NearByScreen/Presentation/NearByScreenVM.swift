//
//  NearByScreenVM.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import Foundation
protocol NearByScreenVMProtocol: ObservableObject {
    var dataSource: [NearByCardModel] { get }
    var filtersDataSource: [FilterModel] { get set }
    var rowsForGrid: [[NearByCardModel]] { get }
    
    func goBack()
    func updateFilterDataSourceModel(_ selectedFilter: FilterModel)
    
}

class NearByScreenVM: NearByScreenVMProtocol {
    private var router: NearByScreenRouterProtocol!
    
    @Published var dataSource: [NearByCardModel] = NearByCardModel.sampleDataList
    @Published var filtersDataSource: [FilterModel] = FilterModel.sampleData
    
    init(router: NearByScreenRouterProtocol) {
        self.router = router
    }
    
    func goBack() {
        router.goBack()
    }
    
    var rowsForGrid: [[NearByCardModel]] {
        stride(from: 0, to: dataSource.count, by: 2).map { index in
            Array(dataSource[index..<min(index + 2, dataSource.count)])
        }
    }
    
    func updateFilterDataSourceModel(_ selectedFilter: FilterModel) {
        for index in filtersDataSource.indices {
            if filtersDataSource[index].id == selectedFilter.id {
                filtersDataSource[index].isSelected.toggle()
            }else {
                filtersDataSource[index].isSelected = false
            }
            
        }
    }
}
