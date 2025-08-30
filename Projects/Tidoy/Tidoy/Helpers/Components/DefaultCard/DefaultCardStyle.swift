//
//  DefaultCardStyle.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 30/05/2025.
//

import SwiftUI

struct CardStyle {
    let showFavorite: Bool
    let showLocationDetail: Bool
    let titleFont: Font
    let subtitleFont: Font
    let ratingFont: Font
    let priceFont: Font
    let durationFont: Font
    let imageAbsoluteWidth: Double
}

let fullCardStyle = CardStyle(
    showFavorite: true,
    showLocationDetail: true,
    titleFont: .bodyMediumSemiBold,
    subtitleFont: .body2XSmallRegular,
    ratingFont: .body2XSmallRegular,
    priceFont: .bodyMediumSemiBold,
    durationFont: .body2XSmallRegular,
    imageAbsoluteWidth: 114.33
)

let compactCardStyle = CardStyle(
    showFavorite: false,
    showLocationDetail: false,
    titleFont: .bodyXSmallSemiBold,
    subtitleFont: .body2XSmallRegular,
    ratingFont: .body2XSmallRegular,
    priceFont: .bodyMediumSemiBold,
    durationFont: .body2XSmallRegular,
    imageAbsoluteWidth: 82.0
)
