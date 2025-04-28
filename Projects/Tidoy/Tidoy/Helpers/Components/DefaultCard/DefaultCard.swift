//
//  DefaultCard.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/03/2025.
//

import SwiftUI

struct DefaultCard: View {
    let height: Double
    let width: Double
    
    let model: DefaultCardModel
    
    var body: some View {
        HStack {
            NetworkImage(url: model.image)
                .frame(width: width * 0.33 )
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        titleSection
                        
                        ratingSection
                        
                        detailSection
                    }
                    priceSection
                }
            }
            .padding(.padding12)
        }
        
        .background {
            RoundedRectangle(cornerRadius: .cornerRadiusS)
                .stroke(.stroke20, lineWidth: 1)
        }
        .background(Color.background10)
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusS))
        .frame(width: width, height: height)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.bodyMediumSemiBold)
                .foregroundStyle(Color.text100)
            Text(model.subTitle)
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
        }
    }
    
    private var ratingSection: some View {
        HStack {
            RatingView(rating: 4.8)
            Text("(\(model.reviewsCount) Review)")
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
        }
    }
    
    
    private var detailSection: some View {
        HStack {
            ForEach(model.detail){ data in
                IconWithText(title: data.title, IconName: data.image)
            }
        }
    }
    
    private var priceSection: some View {
        HStack(spacing: 0) {
            Text("\(model.priceUnit) \(model.price)")
                .font(.bodyMediumSemiBold)
                .foregroundStyle(Color.text100)
            Text("/\(model.duration)")
                .font(.body2XSmallRegular)
                .foregroundStyle(Color.text60)
            Spacer()
            Image(systemName: model.isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(model.isFavorite ? Color.dangerMain : Color.icon60)
        }
    }
}

#Preview {
    ZStack {
        Color.background10
        DefaultCard(height: 172, width: 343, model: DefaultCardModel.sampleData)
    }
}

struct IconWithText: View {
    let title: String
    let IconName: String
    var body: some View {
        HStack {
            Image(IconName)
            Text(title)
        }
        .font(.body2XSmallRegular)
        .foregroundStyle(Color.text60)
    }
}
