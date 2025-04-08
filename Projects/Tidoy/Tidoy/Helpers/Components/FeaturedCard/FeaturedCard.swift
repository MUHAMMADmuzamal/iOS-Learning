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
    let model = FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fUCS1CzD1CgjxZNg6PcBmKzoSCHoFDB3CmshZptImiTJXwgcajBUgDhL0uLukCQi~wu~4WTuyiUKLZ4C85wRuC3ZLH-bLp8TMC-10zsN637-x1~GAX8DueV6~KIZzJ-Y4IKgDNODdpbTJdQRwGktKxTrpjZvCpVlDPSviVjRINun6eSnJhOcnyzKy9a4BOuBSvszpSlwZJOEbwdaXhN1cK2VsGG0iTmL4PC2h81QHxASlMUJE69QiCEzT0lwjrbsjMOCsjXBftgLn8ysf9vIBjgpD9~aNNiYiF5rOzBu~RNjstd5fsoUVUdD5cDpntHrRfFsW3gUeZS8L-NUCw9HPw__", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay")
    FeaturedCard(model: model)
        .frame(width: 165, height: 234)
}

extension FeaturedCardModel {
    static let sampleData: [FeaturedCardModel] = [
        FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fUCS1CzD1CgjxZNg6PcBmKzoSCHoFDB3CmshZptImiTJXwgcajBUgDhL0uLukCQi~wu~4WTuyiUKLZ4C85wRuC3ZLH-bLp8TMC-10zsN637-x1~GAX8DueV6~KIZzJ-Y4IKgDNODdpbTJdQRwGktKxTrpjZvCpVlDPSviVjRINun6eSnJhOcnyzKy9a4BOuBSvszpSlwZJOEbwdaXhN1cK2VsGG0iTmL4PC2h81QHxASlMUJE69QiCEzT0lwjrbsjMOCsjXBftgLn8ysf9vIBjgpD9~aNNiYiF5rOzBu~RNjstd5fsoUVUdD5cDpntHrRfFsW3gUeZS8L-NUCw9HPw__", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/7d04/af67/7141ef107e4c19c111d96d42f5dc97b4?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=m8Rtcm~UWYIifQyxadVZrUfD3DtR2w-vA2ouh6YXrNxoqSBsSZQRheRJTa86rQMlbJAPFYJfm7NpKXSsHW1Jsfs7iG8DF0xxFmgFyK0rG9KJ6d8ng43aGMSYkB7AHoFpgcdtxUD8Q4iI~tlym1yhHI~S-pZoigccVG0HG0UjOIiF~1Ydcw5qpWHVkqqwrj6wIKNVz2ytzYcPvm6nSJ0lYZtb5nTyjRn9E554UbE0RQ5Uaopml-DZpTU1FkQw~ImqsZh6lwLFBXJ8EE~cXH5VeWrHpKNvqSS5M3mX2CpZpbkwjxNHfHOPMHF4nJmUHLqyvM-OGcPcQByGvYlaRmuCKw__", placeName: "Yogyakarta, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://s3-alpha-sig.figma.com/img/bf7a/620f/68e345549f293e8d614948c542a18df5?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fUCS1CzD1CgjxZNg6PcBmKzoSCHoFDB3CmshZptImiTJXwgcajBUgDhL0uLukCQi~wu~4WTuyiUKLZ4C85wRuC3ZLH-bLp8TMC-10zsN637-x1~GAX8DueV6~KIZzJ-Y4IKgDNODdpbTJdQRwGktKxTrpjZvCpVlDPSviVjRINun6eSnJhOcnyzKy9a4BOuBSvszpSlwZJOEbwdaXhN1cK2VsGG0iTmL4PC2h81QHxASlMUJE69QiCEzT0lwjrbsjMOCsjXBftgLn8ysf9vIBjgpD9~aNNiYiF5rOzBu~RNjstd5fsoUVUdD5cDpntHrRfFsW3gUeZS8L-NUCw9HPw__", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay")
    ]
}
