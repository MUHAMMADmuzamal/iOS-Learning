//
//  RoundedTextFieldViewModel.swift
//  Tidoy
//
//  Created by Codes Orbit on 14/08/2024.
//

import Foundation

class RoundedTextFieldViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var state: StateOfTextField
    private let fieldType: TextFieldTypeProtocol
    
    init(fieldType: TextFieldTypeProtocol, state: StateOfTextField = .defaultState) {
        self.fieldType = fieldType
        self.state = state
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
