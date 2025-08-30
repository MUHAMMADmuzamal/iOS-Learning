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
    let model = FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1573790387438-4da905039392?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwxfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay")
    FeaturedCard(model: model)
        .frame(width: 165, height: 234)
}

extension FeaturedCardModel {
    static let sampleData: [FeaturedCardModel] = [
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1555400038-63f5ba517a47?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwyfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Yogyakarta, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1555400038-63f5ba517a47?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwyfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Yogyakarta, Indonesia", recommendation: "167 Recommend Stay"),        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Yogyakarta, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1555400038-63f5ba517a47?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwyfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Yogyakarta, Indonesia", recommendation: "167 Recommend Stay"),
        FeaturedCardModel(imageURL: "https://images.unsplash.com/photo-1577717903315-1691ae25ab3f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHw0fHxiYWxpfGVufDB8fHx8MTc0NzEzMDY2N3ww&ixlib=rb-4.1.0&q=80&w=400", placeName: "Bali, Indonesia", recommendation: "167 Recommend Stay")
    ]
}
