//
//  MessagesView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct MessagesView: View {

    @State var searchText: String = ""
    
    var body: some View {
        NavigationBarContainer {
            ScrollView(.vertical) {
                ForEach(0..<10) { _ in
                    MessagesScreenRow()
                    .padding(.horizontal, .padding16)
                }
            }
            .padding(.top, .padding16)
            .background(Color.background10.ignoresSafeArea())
        }.withCustomNavigationBar(navBar: {
            HStack {
                BackButtonView(action: {}, text: "")
                Spacer()
                SearchField(searchText: $searchText, placeHolderText: "Search")
            }
            .padding(.horizontal, .padding16)
            .background(Color.background10.ignoresSafeArea())
        })
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        MessagesView()
    }
}

struct MessagesScreenRow: View {
    var body: some View {
        VStack {
            HStack {
                avatarView
                VStack(spacing: .padding4) {
                    HStack {
                        Text("Adaline Alexa")
                            .font(.bodyMediumSemiBold)
                        Image("verifiedIcon")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                        Text("Today")
                            .font(.body2XSmallRegular)
                            
                    }
                    .foregroundStyle(Color.text100)
                    HStack {
                        Text("Hi, Yes the room is available, so can make an order")
                            .font(.bodyXSmallRegular)
                            .foregroundStyle(Color.text80)
                        Spacer()
                        circleView
                            
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
        Text("5")
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
        Image("userAvatar")
            .resizable()
            .frame(width: 48)
            .clipShape(Circle())
    }

}
