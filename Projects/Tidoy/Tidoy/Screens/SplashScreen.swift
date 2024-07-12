//
//  SplashScreen.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Image("imgSplashScreen")
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    SplashScreen()
}
