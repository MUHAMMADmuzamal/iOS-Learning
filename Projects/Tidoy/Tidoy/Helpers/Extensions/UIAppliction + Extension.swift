//  UIAppliction + Extension.swift
//  Tidoy
//
//  Created by Codes Orbit on 29/09/2024.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
