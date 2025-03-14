//
//  NearByCards.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/03/2025.
//

import SwiftUI

struct NearByCards: View {
    let url = URL(string: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3")
    var body: some View {
        VStack {
            AsyncImage(url:url ) { image in
                image.scaledToFit()
            } placeholder: {
                ProgressView()
            }


        }
    }
}

#Preview {
    NearByCards()
}
