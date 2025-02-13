//
//  OnboardingScreen.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct OnboardingScreen: View {
    
    private let dataSource = OnboardingCarouselCardModel.data
    @State private var index: Int = 0
    private var dataSourceLength: Int { dataSource.count}
    @Binding var hasCompletedOnboarding: Bool
    var body: some View {
        VStack {
            OnboardingCarousel(dataSource: dataSource, index: $index)
            HStack(spacing: 12) {
                if index != dataSourceLength - 1 {
                    SecondaryButton(title: "Skip", action: {
                        displayNext(skip: true)
                    })
                    .frame(width: 63)
                }
                
                PrimaryButton(title: index == dataSourceLength - 1 ?
                              "Get Started" : "Next",
                              rightIcon: Image(systemName: "arrow.right")) {
                    displayNext()
                }
            }
            .frame(height: 58)
            .padding(.horizontal, 32)
        }
        .onAppear {
            index = 0
        }
    }
    
    func displayNext(skip: Bool = false) {
        if skip {
            index = dataSourceLength
        } else {
            index += 1
        }
        hasCompletedOnboarding = index == dataSourceLength
    }
}

#Preview {
    OnboardingScreen(hasCompletedOnboarding: .constant(false))
}
