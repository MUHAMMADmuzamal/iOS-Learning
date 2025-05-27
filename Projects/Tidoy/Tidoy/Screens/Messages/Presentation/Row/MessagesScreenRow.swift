//
//  MessagesScreenRow.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/05/2025.
//

import SwiftUI

struct MessagesScreenRow: View {
    let model: MessageScreenRowModel
    var body: some View {
        VStack {
            HStack {
                avatarView
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
                        Text(model.date)
                            .font(.body2XSmallRegular)
                            
                    }
                    .foregroundStyle(Color.text100)
                    HStack {
                        Text(model.lastMessage)
                            .font(.bodyXSmallRegular)
                            .foregroundStyle(Color.text80)
                        Spacer()
                        if model.messageCount != 0 {
                            circleView
                        }     
                    }
                }
                Spacer()
            }
            .frame(height: 48)
            .padding(.vertical, .padding24)
            dividerView
        }
    }
    
    private var circleView: some View {
        Text("\(model.messageCount)")
            .font(.bodyXSmallRegular)
            .foregroundStyle(Color.infoMain)
            .padding(.horizontal, .padding8)
            .padding(.vertical, .padding4)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.infoSurface)
                    .frame(height: 20)
            }
    }
    
    private var dividerView: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.neutral40)
    }
    
    private var avatarView: some View {
        NetworkImage(url: model.imageUrl ?? ""){
            Image("userAvatar").resizable()
        }
            .frame(width: 48)
            .clipShape(Circle())
    }

}

#Preview {
    MessagesScreenRow(model: MessageScreenRowModel.mockData)
}
