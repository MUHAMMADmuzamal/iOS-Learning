//
//  MessageScreenRowModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 27/05/2025.
//

import Foundation

struct MessageScreenRowModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isVerified: Bool
    let date: String
    let lastMessage: String
    let messageCount: Int
    let imageUrl: String?
}

extension MessageScreenRowModel {
    static var mockData = MessageScreenRowModel(
        title: "Adaline Alexa",
        isVerified: true,
        date: "Today",
        lastMessage: "Hi, Yes the room is available, so can make an order",
        messageCount: 5,
        imageUrl: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-1.jpg"
    )

    static var mockDataList: [MessageScreenRowModel] = [
        MessageScreenRowModel(
            title: "John Doe",
            isVerified: false,
            date: "Yesterday",
            lastMessage: "Can you share the location again?",
            messageCount: 0,
            imageUrl: "https://randomuser.me/api/portraits/men/1.jpg"
        ),
        MessageScreenRowModel(
            title: "Emily Stone",
            isVerified: true,
            date: "12 May",
            lastMessage: "Thank you!",
            messageCount: 2,
            imageUrl: "https://randomuser.me/api/portraits/women/2.jpg"
        ),
        MessageScreenRowModel(
            title: "Michael Swift",
            isVerified: false,
            date: "10 May",
            lastMessage: "Let’s finalize the payment tomorrow.",
            messageCount: 0,
            imageUrl: "https://randomuser.me/api/portraits/men/3.jpg"
        ),
        MessageScreenRowModel(
            title: "Sophia Luna",
            isVerified: true,
            date: "9 May",
            lastMessage: "Looking forward to meeting you!",
            messageCount: 1,
            imageUrl: "https://randomuser.me/api/portraits/women/4.jpg"
        ),
        MessageScreenRowModel(
            title: "Chris Pine",
            isVerified: true,
            date: "7 May",
            lastMessage: "Sent the documents via email.",
            messageCount: 3,
            imageUrl: "https://randomuser.me/api/portraits/men/5.jpg"
        )
    ]
}

