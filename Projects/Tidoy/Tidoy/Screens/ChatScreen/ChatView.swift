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
                    receivedMessageView
                    sendMessageView
                    Spacer()
                }
                .padding(.top, .padding16)
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
    
    private var sendMessageView: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Hi, for this hotel with a king sweet room are there still any vacancies?")
                    .font(.bodySmallRegular)
                    .foregroundStyle(Color.text100)
                Text("16.50")
                    .font(.body2XSmallRegular)
                    .foregroundStyle(Color.text90)
            }
            .padding(10)
            .frame(width: responsiveWidth(designedWidth: 242, basedOn: 343))
            .background(Color.background40)
            .clipShape(CustomRoundedRectangle(cornerRadius: 12, corners: [.topLeft, .topRight, .bottomRight]))
            
            Spacer()
        }
        .padding(.leading, .padding16)
    }
    
    private var receivedMessageView: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text("Hi, for this hotel with a king sweet room are there still any vacancies?")
                    .font(.bodySmallRegular)
                    .foregroundStyle(Color.neutral10)
                Text("16.50 · Read")
                    .font(.body2XSmallRegular)
                    .foregroundStyle(Color.neutral40)
            }
            .padding(10)
            .frame(width: responsiveWidth(designedWidth: 242, basedOn: 343))
            .background {
                CustomRoundedRectangle(cornerRadius: 12, corners: [.topLeft, .topRight, .bottomLeft])
                    .fill(Color.infoMain)
            }
        }
        .padding(.trailing, .padding16)
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
    
    private func responsiveWidth(designedWidth: CGFloat, basedOn designTotalWidth: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.screenWidth
        return (designedWidth / designTotalWidth) * screenWidth
    }
}

#Preview {
    ChatView()
}
