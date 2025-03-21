//
//  RatingView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/03/2025.
//

import SwiftUI

struct RatingView: View {
    let rating: Double  // 0.0 - 5.0
    var body: some View {
        HStack(spacing: 4) {
            RatingStarView(rating: rating * 20)
                .frame(width: 9, height: 9)
            ratingValue
                .frame(height: 14)
        }
    }
    
    private var ratingValue: some View {
        Text(String(format: "%.1f", rating))
            .font(.body2XSmallRegular)
    }
}

#Preview {
    RatingView(rating: 2.5)
}


