//
//  OnboardingCarouselModel.swift
//  Tidoy
//
//  Created by Codes Orbit on 08/02/2025.
//

import Foundation

struct OnboardingCarouselCardModel {
    let image: String
    let title: String
    let subTitle: String
}

extension OnboardingCarouselCardModel {
    static let data = [
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
}
