//
//  ChatMessageView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 30/05/2025.
//

import SwiftUI

struct ChatMessageView: View {
    let model:ChatMessageModel
    let style: ChatMessageViewStyle

    var body: some View {
        HStack {
            if !style.isSender {
                Spacer()
            }
            
            HStack{
                VStack(alignment: style.isSender ? .leading : .trailing, spacing: 4) {
                    Text(model.message)
                        .font(style.messageFont)
                        .foregroundStyle(style.messageColor)
                    Text(model.time)
                        .font(style.timeFont)
                        .foregroundStyle(style.messageColor)
                }
                Spacer()
            }
            .padding(10)
            .frame(width:242.0.responsive(basedOn: 343, current: UIScreen.screenWidth) )
            .background(style.backgroundColor)
            .clipShape(CustomRoundedRectangle(
                cornerRadius: 12,
                corners:
                    style.isSender ?
                    [.topLeft, .topRight, .bottomRight] :
                    [.topLeft, .topRight, .bottomLeft]))
            
            if style.isSender {
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        ChatMessageView(model: ChatMessageModel.mockData[0], style: receivedMessageStyle)
        ChatMessageView(model: ChatMessageModel.mockData[0], style: sendMessageStyle)
        
    }
}
