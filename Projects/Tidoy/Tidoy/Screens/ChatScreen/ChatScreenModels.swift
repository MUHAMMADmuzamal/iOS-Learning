//
//  ChatScreenModels.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 30/05/2025.
//

import Foundation

struct ChatViewNavigationBarModel {
    let title: String
    let isVerified: Bool
    let subTitle: String
    let imageUrl: String?
}

extension ChatViewNavigationBarModel {
    static var mockData = ChatViewNavigationBarModel(
        title: "Adaline Alexa",
        isVerified: true,
        subTitle: "Property Owner",
        imageUrl: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg"
    )
}
