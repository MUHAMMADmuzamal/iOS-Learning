//
//  HomeSectionHeader.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 22/03/2025.
//

import SwiftUI

struct HomeSectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.bodySmallSemiBold)
            Spacer()
            Button {
                
            } label: {
                Text("Show all")
                    .font(.body2XSmallSemiBold)
                    .underline()
            }
        }
        .foregroundStyle(Color.text100)
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeSectionHeader(title: "Near by")
}
