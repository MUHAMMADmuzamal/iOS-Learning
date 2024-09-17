//
//  HapticManager.swift
//  Crypto
//
//  Created by Codes Orbit on 17/09/2024.
//

import Foundation
import SwiftUI

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
