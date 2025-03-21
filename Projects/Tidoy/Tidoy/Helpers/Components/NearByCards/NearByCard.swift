//
//  NearByCards.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/03/2025.
//

import SwiftUI

struct NearByCard: View {
    let model: NearByCardModel
    @State private var isFavorite: Bool = false
    let height: Double
    let width: Double
    var textColor: Color = .text100
    
    init(model: NearByCardModel, height: Double, width: Double) {
        self.model = model
        self.height = height
        self.width = width
        
        textColor = model.isAvailable ? .text100 : .text60
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            cardImage
                .frame(height: height * 0.7)
            
            VStack(alignment: .leading, spacing: 4) {
                titleSection
                HStack(spacing: 4) {
                    rating
                    verticalDivider
                    distance
                }
                priceSection
            }
            .padding(8)
        }
        .frame(width: width)
        .overlay(alignment: .topTrailing) {
            FavoriteButton
                .padding([.top, .trailing], 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusXS))
        .background() {
            RoundedRectangle(cornerRadius: .cornerRadiusXS)
                .stroke(.stroke20, lineWidth: 1)
        }
        .background {
            Color.background10
        }
        .onAppear {
            isFavorite = model.isFavorite
        }
    }
}

#Preview {
    let height =  UIScreen.main.bounds.height - 10
    let width =  UIScreen.main.bounds.width - 10
    NearByCard(model: .sampleData, height: height, width: width)
        .environment(\.imageLoader, KingfisherImageLoader())
        .padding()
}

extension NearByCard {
    private var cardImage: some View {
        NetworkImage(url: URL(string: model.imageURL)!)
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
            Text(model.nameOfHouse)
                .font(.bodyXSmallSemiBold)
                .foregroundStyle(textColor)
            Text(model.addressOfHouse)
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
        }
    }
    
    private var rating: some View {
        RatingView(rating: model.rating)
            .foregroundStyle(textColor)
    }
    
    private var distance: some View {
        Text("\(model.distance)\(model.distanceUnit) away")
            .font(.body2XSmallRegular)
            .foregroundStyle(textColor)
    }
    
    private var verticalDivider: some View {
        Rectangle()
            .frame(width: 1, height: 8)
            .foregroundStyle(Color.stroke20)
    }
    
    private var priceSection: some View {
        let text = model.isAvailable ?
        "\(model.priceUnit)\(model.price)" : "Not Available"
        
        return HStack(spacing: 0) {
                Text(text)
                    .font(.bodySmallSemiBold)
                    .foregroundStyle(textColor)
                    
            Text("/\(model.duration)")
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
                .isHiddenWithOutSpace(!model.isAvailable)
        }
    }
}
