//
//  OnboardingScreen.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct OnboardingScreen: View {
    private let dataSource = [
        OnboardingCarouselCardModel(
           image: "onboardingCarousel-Image1",
           title: "Gateway to Your Adventure",
           subTitle: "Enjoy various housing options, from budget to luxury, in Tidoy."),
        OnboardingCarouselCardModel(
           image: "onboardingCarousel-Image2",
           title: "Discover the Wonders of the World: Let's Explore!",
           subTitle: "Book a stay wherever you are, whenever you want."),
        OnboardingCarouselCardModel(
           image: "onboardingCarousel-Image3",
           title: "The Right Solution for Your Holiday Accommodation",
           subTitle: "A stress-free Holiday? Trust your Holiday accommodation to Tidoy!")
    ]
    @State private var index: Int = 0
    var body: some View {
        VStack {
            OnboardingCarousel(dataSource: dataSource, index: $index)
            HStack(spacing: 12) {
                SecondaryButton(title: "Skip", action: {})
                    .frame(width: 63)
                PrimaryButton(title: "Next", rightIcon: Image(systemName: "arrow.right")) {
                    index = index != dataSource.count - 1 ? index + 1 : 0
                }
                    .frame(width: 236)
            }
            .frame(height: 58)
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    OnboardingScreen()
}
