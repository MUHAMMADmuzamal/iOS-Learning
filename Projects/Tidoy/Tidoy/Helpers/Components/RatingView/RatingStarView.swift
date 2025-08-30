//
//  RatingStarView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/03/2025.
//

import SwiftUI

struct RatingStarView: View {
    var rating: CGFloat // 0 to 100

    var body: some View {
        ZStack {
            // Background star (unfilled part)
            Image(systemName: "star")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.primaryMain)
            
            // Foreground star (filled part)
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.primaryMain)
                .clipShape(StarClipShape(progress: rating / 100))
        }
    }
}


struct StarClipShape: Shape {
    var progress: CGFloat // 0.0 to 1.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width * progress
        path.addRect(CGRect(x: 0, y: 0, width: width, height: rect.height))
        return path
    }
}

#Preview {
    RatingStarView(rating: 50)
}
