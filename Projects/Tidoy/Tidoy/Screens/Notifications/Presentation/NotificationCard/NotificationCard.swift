//
//  NotificationCard.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 15/05/2025.
//

import SwiftUI

struct NotificationCard: View {
    let model: NotificationCardModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("verifiedIcon")
                Text("Get Disc \(model.getDiscountString())%")
                    .font(.bodySmallSemiBold)
                Spacer()
                Text(model.date)
                    .font(.body2XSmallRegular)
            }
            .foregroundStyle(Color.text100)
            
            NetworkImage(url: model.imageURL)
                .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusXS))
                .frame(height: 135)
            
            Text(model.description)
                .font(.bodyXSmallRegular)
                .foregroundStyle(Color.text80)
            
            RoundedRectangle(cornerRadius: .cornerRadiusS)
                .fill(Color.background10)
                .frame(height: 40)
                .roundedBorder(cornerRadius: .cornerRadiusS, color: Color.stroke40)
                .overlay {
                    HStack {
                        Text(model.promoCode)
                            .font(.bodyMediumMedium)
                            .foregroundStyle(Color.text100)
                        Spacer()
                        Image("copyIcon")
                            .foregroundStyle(Color.icon100)
                    }
                    .padding(.horizontal, .padding12)
                    .padding(.vertical, .padding8)
                }
            
            Text(model.promoCodeDescription)
                .font(.bodyXSmallRegular)
                .foregroundStyle(Color.text80)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.neutral40)
        }
    }
}

#Preview {
    ZStack {
        Color.background10
        NotificationCard(model: NotificationCardModel.sampleData[0])
    }
}
