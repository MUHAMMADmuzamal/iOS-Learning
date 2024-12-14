//
//  CountryListVM.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/08/2024.
//

import Foundation
import Combine

class CountryListVM: ObservableObject {
    
    @Published var selectedCountry: CountryModel?
    @Published var countriesList: [CountryModel] = []
    @Published var searchText: String = ""
    
    private var cancelBag = Set<AnyCancellable>()
    
    
    init() {
        self.binding()
    }
    
    private func binding() {
        $searchText.sink {[weak self] value in
            guard let self = self else { return }
            if value.isEmpty {
                self.countriesList = allCountersList
            } else {
                self.countriesList = allCountersList.filter({$0.name.contains(value) || $0.code.contains(value)})
            }
        }.store(in: &cancelBag)
    }
    
    func isSelected(country: CountryModel) -> Bool {
        selectedCountry?.code == country.code
    }
    
    func selectedCountry(country: CountryModel) {
        self.selectedCountry = country
    }
}
