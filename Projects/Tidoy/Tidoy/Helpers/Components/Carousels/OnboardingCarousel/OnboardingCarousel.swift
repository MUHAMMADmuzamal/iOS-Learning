//
//  OnboardingCarousel.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct OnboardingCarousel: View {
    var dataSource: [OnboardingCarouselCardModel]
    let heightOfIndicator: CGFloat = 8.0
    let spacingIndicator: CGFloat = 8.0
    let widthOfSelectedIndicator: CGFloat = 26.0
    @Binding var index: Int
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<dataSource.count, id: \.self) { index in
                    OnboardingCarouselCard(model: dataSource[index]).tag(index)
                }
            }.tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack(spacing: spacingIndicator) {
                ForEach(0..<dataSource.count, id: \.self) { index in
                    if self.index == index {
                        RoundedRectangle(cornerRadius: heightOfIndicator)
                            .fill(.backgroundPrimary)
                            .frame(width: widthOfSelectedIndicator, height: heightOfIndicator)
                    } else {
                        Circle()
                            .fill(.background30)
                            .frame(width: heightOfIndicator)
                    }
                }
            }
        }
    }
}

#Preview {
    let dataSource = [
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
    return OnboardingCarousel(dataSource: dataSource, index: .constant(0))
}
