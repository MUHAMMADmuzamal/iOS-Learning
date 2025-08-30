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
    let style: CardStyle
    
    var body: some View {
        let imageWidthRatio = style.imageAbsoluteWidth / width
        HStack {
            NetworkImage(url: model.image)
                .frame(width: width * imageWidthRatio)
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        titleSection
                        
                        ratingSection
                        
                        if style.showLocationDetail {
                            detailSection
                        }
                    }
                    priceSection
                }
            }
            .padding(.padding12)
        }
        .frame(width: width, height: height)
        .background {
            RoundedRectangle(cornerRadius: .cornerRadiusS)
                .stroke(.stroke20, lineWidth: 1)
        }
        .background(Color.background10)
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusS))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(style.titleFont)
                .foregroundStyle(Color.text100)
            Text(model.subTitle)
                .font(style.subtitleFont)
                .foregroundStyle(Color.text60)
        }
    }
    
    private var ratingSection: some View {
        HStack {
            RatingView(rating: 4.8)
            Text("(\(model.reviewsCount) Review)")
                .font(style.ratingFont)
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
                .font(style.priceFont)
                .foregroundStyle(Color.text100)
            Text("/\(model.duration)")
                .font(style.durationFont)
                .foregroundStyle(Color.text60)
            Spacer()
            if style.showFavorite {
                Image(systemName: model.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(model.isFavorite ? Color.dangerMain : Color.icon60)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.background10
        VStack {
            DefaultCard(height: 172, width: 343, model: DefaultCardModel.sampleData, style: fullCardStyle)
                .padding(.bottom, 100)
            
            DefaultCard(height: 100, width: 343, model: DefaultCardModel.sampleData1, style: compactCardStyle)
        }
    }
}
