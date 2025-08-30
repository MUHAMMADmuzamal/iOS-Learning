//
//  IconWithText.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 30/05/2025.
//

import SwiftUI

struct IconWithText: View {
    let title: String
    let IconName: String
    var body: some View {
        HStack {
            Image(IconName)
            Text(title)
        }
        .font(.body2XSmallRegular)
        .foregroundStyle(Color.text60)
    }
}

#Preview {
    IconWithText(title: "bed", IconName: "bed")
}
