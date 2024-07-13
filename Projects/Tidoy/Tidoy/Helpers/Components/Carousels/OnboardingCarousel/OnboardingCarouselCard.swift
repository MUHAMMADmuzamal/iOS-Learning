//
//  OnboardingCarouselCard.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct OnboardingCarouselCardModel {
    let image: String
    let title: String
    let subTitle: String
}

struct OnboardingCarouselCard: View {
    @Binding var  model: OnboardingCarouselCardModel
    var body: some View {
        VStack {
            Image(model.image)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.heading4)
                Text(model.subTitle)
                    .font(.bodyMediumRegular)
            }
            .padding(.horizontal, .padding16)
        }
    }
}

#Preview {
     let model = OnboardingCarouselCardModel(
        image: "onboardingCarousel-Image1",
        title: "Gateway to Your Adventure",
        subTitle: "Enjoy various housing options, from budget to luxury, in Tidoy.")
    
    return OnboardingCarouselCard(model: .constant(model))
}
