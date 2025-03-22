//
//  FeaturedCard.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct FeaturedCard: View {
    var body: some View {
        NetworkImage(url: URL(string: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QjBzLYn2g0Og6b-9yvemvsUv1w1tByhvA2zKsI710g1nvf-YWaN74R-zthBJ4GA8WyISayidOzwPpf5z-gGoTowYpXPMPpjy2~ysBJYXD5quJwT5np2s4w2YKYDj~LlTrQUp12mcr-N9xSPVDIs-z--2HwrV5XIILYfM4Ks9pvgQl43x1zwA0qD19gMkvLGw9pzRzAKn-tFUkncGWpEvCFvc4-AgO2VW5ORDYJ6l0NaZwntu~9teCTfko3GWpOd4CrVgDz5pDIPQX8eEeDbhNtudFRNFDMMuFPgl9CYtL2732tkAphH5~sQcE6SX4dT2PHhojpM96BRSgEMZPxkXRg__")!)
            .overlay {
                LinearGradient(
                        gradient: Gradient(colors: [
                            Color.gray.opacity(0.0),
                            Color(hex: "#343434")
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text("Bali, Indonesia")
                        .font(.bodyMediumSemiBold)
                        .foregroundStyle(Color.neutral10)
                    Text("167 Recommend Stay")
                        .font(.body2XSmallRegular)
                        .foregroundStyle(Color.text50)
                }
                .padding([.bottom, .leading, .trailing], 8)
            }
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusXS))
        
    }
}

#Preview {
    FeaturedCard()
        .frame(width: 165, height: 234)
}
