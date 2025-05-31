//
//  ChatMessageModelAndStyle.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 30/05/2025.
//

import SwiftUI

struct ChatMessageModel: Identifiable {
    let id: String = UUID().uuidString
    let message: String
    let time: String
    let isSender: Bool
}
extension ChatMessageModel {
    static let mockData : [ChatMessageModel] = [
        .init(message: "Hi, for this hotel with a king sweet room are there still any vacancies?", time: "16.50", isSender: false),
        .init(message: "Yes, there are still 2 vacancies. Please let me know if you would like to book.", time: "16.55", isSender: true),
        .init(message: "Great! I'll book.", time: "17.00", isSender: true),
        ]
    
}

struct ChatMessageViewStyle {
    let messageFont: Font
    let timeFont: Font
    let backgroundColor: Color
    let messageColor: Color
    let timeColor: Color
    let isSender: Bool
}

let sendMessageStyle = ChatMessageViewStyle (
    messageFont: .bodySmallRegular,
    timeFont: .body2XSmallRegular,
    backgroundColor: .background40,
    messageColor: .text100,
    timeColor: .text90,
    isSender: true)

let receivedMessageStyle = ChatMessageViewStyle (
    messageFont: .bodySmallRegular,
    timeFont: .body2XSmallRegular,
    backgroundColor: .infoMain,
    messageColor: .neutral10,
    timeColor: .neutral40,
    isSender: false)
