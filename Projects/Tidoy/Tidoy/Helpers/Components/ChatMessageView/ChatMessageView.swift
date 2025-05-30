//
//  ChatMessageView.swift
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
    let bubbleShape: AnyShape
    let isSender: Bool
}

let sendMessageStyle = ChatMessageViewStyle (
    messageFont: .bodySmallRegular,
    timeFont: .body2XSmallRegular,
    backgroundColor: .background40,
    messageColor: .text100,
    timeColor: .text90,
    bubbleShape: AnyShape(CustomRoundedRectangle(cornerRadius: 12, corners: [.topLeft, .topRight, .bottomRight])),
    isSender: true)

let receivedMessageStyle = ChatMessageViewStyle (
    messageFont: .bodySmallRegular,
    timeFont: .body2XSmallRegular,
    backgroundColor: .infoMain,
    messageColor: .neutral10,
    timeColor: .neutral40,
    bubbleShape: AnyShape(CustomRoundedRectangle(cornerRadius: 12, corners: [.topLeft, .topRight, .bottomLeft])),
    isSender: false)

struct ChatMessageView: View {
    let model:ChatMessageModel
    let style: ChatMessageViewStyle
    
    var body: some View {
        HStack {
            if !style.isSender {
                Spacer()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(model.message)
                    .font(style.messageFont)
                    .foregroundStyle(style.messageColor)
                Text(model.time)
                    .font(style.timeFont)
                    .foregroundStyle(style.messageColor)
            }
            .padding(10)
            .frame(width: responsiveWidth(designedWidth: 242, basedOn: 343))
            .background(style.backgroundColor)
            .clipShape(style.bubbleShape)
            
            if style.isSender {
                Spacer()
            }
        }
        .padding(.leading, .padding16)
    }
    ////
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    private func responsiveWidth(designedWidth: CGFloat, basedOn designTotalWidth: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return (designedWidth / designTotalWidth) * screenWidth
    }
}

#Preview {
    VStack {
        ChatMessageView(model: ChatMessageModel.mockData[0], style: receivedMessageStyle)
        ChatMessageView(model: ChatMessageModel.mockData[0], style: sendMessageStyle)
        
    }
}
