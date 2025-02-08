//
//  OnboardingScreen.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    private var router = OnboardingRouter()
    
    private let dataSource = OnboardingCarouselCardModel.data
    @State private var index: Int = 0
    private var dataSourceLength: Int { dataSource.count}
    var body: some View {
        VStack {
            OnboardingCarousel(dataSource: dataSource, index: $index)
            HStack(spacing: 12) {
                if index != dataSourceLength - 1 {
                    SecondaryButton(title: "Skip", action: {})
                        .frame(width: 63)
                }
                
                PrimaryButton(title: index == dataSourceLength - 1 ?
                              "Get Started" : "Next",
                              rightIcon: Image(systemName: "arrow.right")) {
                    index += 1
                    if index == dataSourceLength {
                        router.navigate(to: SignupRoute(), coordinator: coordinator)
                    }
                }
            }
            .frame(height: 58)
            .padding(.horizontal, 32)
        }
        .onAppear {
            index = 0
        }
        .navigationDestination(for: AnyRoute.self) { route in
            route.destinationView()
        }
    }
}

#Preview {
    OnboardingScreen()
        .environmentObject(AppCoordinator())
}
