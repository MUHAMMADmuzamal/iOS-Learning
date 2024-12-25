//
//  PhoneNumberTextFieldViewModel.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/08/2024.
//

import Foundation
class PhoneNumberTextFieldViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var state: StateOfTextField
    private let fieldType: TextFieldTypeProtocol
    
    @Published var selectedCountry: CountryModel
    @Published var isTapOnIcon: Bool = false
    
    init(fieldType: TextFieldTypeProtocol, state: StateOfTextField = .defaultState, selectedCountry: CountryModel) {
        self.fieldType = fieldType
        self.state = state
        self.selectedCountry = selectedCountry
    }
    
    func validate() {
        if text.isEmpty {
            state = .defaultState
        } else if !fieldType.isValid(for: text) {
            state = .error
        } else {
            state = .fill
        }
    }
    
    func onHover(isHovering: Bool) {
        if isHovering {
            state = .hover
        } else {
            validate()
        }
    }
    
    func onFocusChange(isFocused: Bool) {
        state = isFocused ? .focus : .defaultState
        validate()
    }
}
