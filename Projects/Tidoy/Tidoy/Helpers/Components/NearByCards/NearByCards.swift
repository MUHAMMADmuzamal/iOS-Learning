//
//  NearByCards.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/03/2025.
//

import SwiftUI

struct NearByCards: View {
    let url = URL(string: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3")
    @State private var isFavorite: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            cardImage
                
            VStack(alignment: .leading, spacing: 4) {
                titleSection
                rating
                priceSection
            }
            .padding(8)
        }
        .overlay(alignment: .topTrailing) {
            FavoriteButton
            .padding([.top, .trailing], 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusXS))
        .background() {
            RoundedRectangle(cornerRadius: .cornerRadiusXS)
                .stroke(.stroke20, lineWidth: 1)
        }
    }
}

#Preview {
    NearByCards()
        .environment(\.imageLoader, KingfisherImageLoader())
        .padding()
}

extension NearByCards {
    private var cardImage: some View {
        NetworkImage(url: url!)
    }
    
    private var FavoriteButton: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(systemName: "heart\(isFavorite ? ".fill" : "")")
                .foregroundStyle(isFavorite ? .dangerMain : .stroke20)
        }
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Pasteur Luxury Home")
                .font(.bodyXSmallSemiBold)
                .foregroundStyle(Color.text100)
            Text("Dago Pakar, Bandung")
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
        }
    }
    
    private var rating: some View {
        Text("⭐️4.8 25km away")
            .font(.body2XSmallRegular)
            .foregroundStyle(Color.text100)
    }
    
    private var priceSection: some View {
        HStack {
            Text("$152")
                .font(.bodySmallSemiBold)
                .foregroundStyle(Color.text100)
            Text("/night")
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
        }
    }
}
