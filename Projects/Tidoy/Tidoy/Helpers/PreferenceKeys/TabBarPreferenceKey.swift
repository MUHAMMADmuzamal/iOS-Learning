//
//  TabBarPreferenceKey.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 24/04/2025.
//

import SwiftUI

struct TabBarItemsPreferenceKeys: PreferenceKey {
    
    static var defaultValue: [TabBarItems] = []
    
    static func reduce(value: inout [TabBarItems], nextValue: () -> [TabBarItems]) {
        value += nextValue()
    }
}
