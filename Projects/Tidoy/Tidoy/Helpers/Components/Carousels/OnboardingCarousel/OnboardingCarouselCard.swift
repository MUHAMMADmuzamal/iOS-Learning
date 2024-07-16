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
    var  model: OnboardingCarouselCardModel
    @State private var rotate: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(model.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    VStack {
                        LinearGradient(stops: [
                            .init(color: .clear, location: 0.53),
                            .init(color: .white, location: 1)],
                                       startPoint: .bottom,
                                       endPoint: .top)
                        
                        LinearGradient(stops: [
                            .init(color: .clear, location: 0.53),
                                .init(color: .white, location: 1)],
                                       startPoint: .top,
                                       endPoint: .bottom)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusM))
                .rotationEffect(Angle(degrees: rotate))
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.heading4)
                    .foregroundStyle(.text100)
                Text(model.subTitle)
                    .font(.bodyMediumRegular)
                    .foregroundStyle(.text60)
            }
        }
        .padding(.horizontal, .padding16)
        .onAppear {
            withAnimation(.bouncy) {
                rotate = 360
            }
        }
        .onDisappear {
            rotate = 0
        }
    }
}

#Preview {
     let model = OnboardingCarouselCardModel(
        image: "onboardingCarousel-Image3",
        title: "Gateway to Your Adventure",
        subTitle: "Enjoy various housing options, from budget to luxury, in Tidoy.")
    
    return OnboardingCarouselCard(model: model)
}
