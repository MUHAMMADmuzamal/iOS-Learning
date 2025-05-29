//
//  ChatView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 29/05/2025.
//

import SwiftUI

struct ChatViewNavigationBarModel {
    let title: String
    let isVerified: Bool
    let subTitle: String
    let imageUrl: String?
}

extension ChatViewNavigationBarModel {
    static var mockData = ChatViewNavigationBarModel(
        title: "Adaline Alexa",
        isVerified: true,
        subTitle: "Property Owner",
        imageUrl: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg"
    )
}

struct ChatView: View {
    let model: ChatViewNavigationBarModel = ChatViewNavigationBarModel.mockData
    var body: some View {
        NavigationBarContainer {
            Color.background10
        }.withCustomNavigationBar {
            navBarView
        }
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
