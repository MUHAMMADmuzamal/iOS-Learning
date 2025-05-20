//
//  UIPasteboard + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/05/2025.
//

import UIKit

extension UIPasteboard {
    static func copy(_ text: String) {
        UIPasteboard.general.string = text
    }
}
