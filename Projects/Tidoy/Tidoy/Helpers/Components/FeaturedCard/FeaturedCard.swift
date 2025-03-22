//
//  FeaturedCard.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct FeaturedCardModel: Identifiable {
    let id: String
    let imageURL: String
    let placeName: String
    let recommendation: String
    
    init(id: String, imageURL: String, placeName: String, recommendation: String) {
        self.id = id
        self.imageURL = imageURL
        self.placeName = placeName
        self.recommendation = recommendation
    }
    
    init(imageURL: String, placeName: String, recommendation: String) {
        self.id = UUID().uuidString
        self.imageURL = imageURL
        self.placeName = placeName
        self.recommendation = recommendation
    }
    
}

struct FeaturedCard: View {
    let model: FeaturedCardModel
    var body: some View {
        NetworkImage(url: model.imageURL)
            .overlay {
                LinearGradient(
                     gradient: Gradient(stops: [
                         .init(color: Color(hex: "#343434"), location: 0.0),
                         .init(color: Color(hex: "#343434"), location: 0.2),
                         .init(color: Color(hex: "#D9D9D900"), location: 1.0)
                     ]),
                     startPoint: .bottom,
                     endPoint: .top
                 )
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text(model.placeName)
                        .lineLimit(1)
                        .font(.bodyMediumSemiBold)
                        .foregroundStyle(Color.neutral10)
                    Text(model.recommendation)
                        .font(.body2XSmallRegular)
                        .foregroundStyle(Color.text50)
                }
                .padding([.bottom, .leading, .trailing], 8)
            }
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusXS))
        
    }
}

#Preview {
    let model = FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QjBzLYn2g0Og6b-9yvemvsUv1w1tByhvA2zKsI710g1nvf-YWaN74R-zthBJ4GA8WyISayidOzwPpf5z-gGoTowYpXPMPpjy2~ysBJYXD5quJwT5np2s4w2YKYDj~LlTrQUp12mcr-N9xSPVDIs-z--2HwrV5XIILYfM4Ks9pvgQl43x1zwA0qD19gMkvLGw9pzRzAKn-tFUkncGWpEvCFvc4-AgO2VW5ORDYJ6l0NaZwntu~9teCTfko3GWpOd4CrVgDz5pDIPQX8eEeDbhNtudFRNFDMMuFPgl9CYtL2732tkAphH5~sQcE6SX4dT2PHhojpM96BRSgEMZPxkXRg__", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay")
    FeaturedCard(model: model)
        .frame(width: 165, height: 234)
}

extension FeaturedCardModel {
    static let sampleData: [FeaturedCardModel] = [
        FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QjBzLYn2g0Og6b-9yvemvsUv1w1tByhvA2zKsI710g1nvf-YWaN74R-zthBJ4GA8WyISayidOzwPpf5z-gGoTowYpXPMPpjy2~ysBJYXD5quJwT5np2s4w2YKYDj~LlTrQUp12mcr-N9xSPVDIs-z--2HwrV5XIILYfM4Ks9pvgQl43x1zwA0qD19gMkvLGw9pzRzAKn-tFUkncGWpEvCFvc4-AgO2VW5ORDYJ6l0NaZwntu~9teCTfko3GWpOd4CrVgDz5pDIPQX8eEeDbhNtudFRNFDMMuFPgl9CYtL2732tkAphH5~sQcE6SX4dT2PHhojpM96BRSgEMZPxkXRg__", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/7d04/af67/7141ef107e4c19c111d96d42f5dc97b4?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SbVoFpCKihldFAylA1XHgEfSXTWMy9YoVClCZpRfI1eOOP5JOIWS-UZHL28Su~Fa5H7uadgSCi~i8uwqqhid3qJx2S-CPCmabn2TqAgJ6O93T6qzrm1tsvoS-8BpZdRMqhfsVMymKbQML7TGLqZQiRslzfCHlltgyNqWM7ULaelJ86ZoYbAFVQDrydOq9-7sZFVgKYOxHn8WBq7~ZoOoglk7I293jIoF2qZLTuspjS9lq0xm7-~49yiBkUIEsb8aIGl7cMFF~wc~6iSAfriW9Rc9aUZftIDWGoXgoUKpgAvX7AoZcCkazlxJxJSgMnNdgpi4YH2NCG3veV~zemO~CQ__", placeName: "Yogyakarta, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=QjBzLYn2g0Og6b-9yvemvsUv1w1tByhvA2zKsI710g1nvf-YWaN74R-zthBJ4GA8WyISayidOzwPpf5z-gGoTowYpXPMPpjy2~ysBJYXD5quJwT5np2s4w2YKYDj~LlTrQUp12mcr-N9xSPVDIs-z--2HwrV5XIILYfM4Ks9pvgQl43x1zwA0qD19gMkvLGw9pzRzAKn-tFUkncGWpEvCFvc4-AgO2VW5ORDYJ6l0NaZwntu~9teCTfko3GWpOd4CrVgDz5pDIPQX8eEeDbhNtudFRNFDMMuFPgl9CYtL2732tkAphH5~sQcE6SX4dT2PHhojpM96BRSgEMZPxkXRg__", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay")
    ]
}
