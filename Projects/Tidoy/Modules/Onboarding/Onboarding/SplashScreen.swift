//
//  SplashScreen.swift
//  Onboarding
//
//  Created by Codes Orbit on 14/06/2024.
//

import SwiftUI
import Shared

public struct SplashScreen: View {
    public init() {}
    public var body: some View {
        VStack {
            Image("apple")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            Text("Hello, World!")
        }
    }
}

#Preview {
    SplashScreen()
}
