//
//  ChatView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 29/05/2025.
//

import SwiftUI

struct ChatView: View {
    let model: ChatViewNavigationBarModel = ChatViewNavigationBarModel.mockData
    let screenWidth = UIScreen.screenWidth
    
    var body: some View {
        NavigationBarContainer {
            ZStack {
                background
                VStack {
                    cardView
                    ForEach(ChatMessageModel.mockData, id: \.id) { model in
                        ChatMessageView(model: model, style: model.isSender ? sendMessageStyle : receivedMessageStyle)
                    }
                    Spacer()
                }
                .padding(.padding16)
            }
            
        }.withCustomNavigationBar {
            navBarView
        }
    }
    
    private var background: some View {
        Color.background10
            .ignoresSafeArea()
    }
    
    private var cardView: some View {
        DefaultCard(height: 100, width: screenWidth - .padding32, model: DefaultCardModel.sampleData1, style: compactCardStyle)
    }
    
    private var avatarView: some View {
        NetworkImage(url: model.imageUrl ?? ""){
            Image("userAvatar").resizable()
        }
        .frame(width: 30)
        .clipShape(Circle())
    }
    
    private var textView: some View {
        VStack(spacing: .padding4) {
            HStack {
                Text(model.title)
                    .font(.bodyMediumSemiBold)
                if model.isVerified {
                    Image("verifiedIcon")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                
                Spacer()
            }
            .foregroundStyle(Color.text100)
            HStack {
                Text(model.subTitle)
                    .font(.bodyXSmallRegular)
                    .foregroundStyle(Color.text80)
                Spacer()
            }
        }
    }
    
    private var navBarView: some View {
        HStack(spacing: .padding8) {
            BackButtonView(action: {}, text: "")
                .frame(width: 24, height: 24)
            avatarView
            textView
            HStack(spacing: .padding12) {
                Image("video")
                Image("audio")
            }.foregroundStyle(Color.icon80)
            Spacer()
        }
        .padding(.leading, .padding16)
        .frame(height: 72)
        .background(Color.background10)
    }
}

#Preview {
    ChatView()
}
