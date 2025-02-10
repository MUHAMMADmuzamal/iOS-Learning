//
//  SplashScreen.swift
//  Tidoy
//
//  Created by Codes Orbit on 12/07/2024.
//

import SwiftUI

struct SplashScreen: View {
    
    var onFinish: () -> Void
    
    init(onFinish: @escaping () -> Void) {
        self.onFinish = onFinish
    }
    
    var body: some View {
        ZStack {
            Image("splashScreenImg")
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                onFinish()
            }
        }
    }
}

#Preview {
    SplashScreen {
        print("splash screen display completed.")
    }
}
