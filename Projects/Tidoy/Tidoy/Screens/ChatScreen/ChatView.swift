//
//  ChatView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 29/05/2025.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var keyboard = KeyboardObserver()
    @State var writeMessageTex: String = ""
    
    let model: ChatViewNavigationBarModel = ChatViewNavigationBarModel.mockData
    let screenWidth = UIScreen.screenWidth
    
    var body: some View {
        NavigationBarContainer {
            ZStack {
                background
                VStack {
                    cardView
                    ScrollView(.vertical) {
                        ForEach(ChatMessageModel.mockData, id: \.id) { model in
                            ChatMessageView(model: model, style: model.isSender ? sendMessageStyle : receivedMessageStyle)
                        }
                    }
                    Spacer()
                    writeMessageView
                        .padding(.horizontal, -16)
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
    
    private var writeMessageView: some View {
        VStack {
            Rectangle().frame(height: 1)
                .foregroundStyle(.stroke20)
            HStack (alignment: .center, spacing: 26 ){
                if !keyboard.isKeyboardVisible {
                    Button {} label: {
                        Image(.attachment)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 15)
                    }
                }
              
                
                MessageTextField(text: $writeMessageTex)
                if !keyboard.isKeyboardVisible {
                    Button {} label: {
                        Image(.camera)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 15)
                    }
                    Button {} label: {
                        Image(.mic)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 15)
                    }
                }

            }
            .foregroundStyle(.icon90)
            .padding(.horizontal, 26)
            .padding(.vertical, 16)
        }
        
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
