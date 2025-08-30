//
//  NotificationCardModel.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 20/05/2025.
//

import Foundation

struct NotificationCardModel: Identifiable {
    let id: String = UUID().uuidString
    let discount: Float
    let date: String
    let imageURL: String
    let description: String
    let promoCode: String
    let promoCodeDescription: String
    
    
    func getDiscountString() -> String {
        String(format: "%.1f", self.discount)
    }
}


extension NotificationCardModel {
    static let sampleData: [NotificationCardModel] = [
        NotificationCardModel(
            discount: 50.0,
            date: "4/4/24",
            imageURL: "https://images.unsplash.com/photo-1568605114967-8130f3a36994?ixid=M3w3MjIxMDl8MHwxfHNlYXJjaHwzfHxob3VzZXxlbnwwfHx8fDE3NDE5MzY2Njd8MA&ixlib=rb-4.0.3",
            description: "Hi, we have good news for you! Get 50% off all products in our store. This promo is valid for a limited time, so don't miss out.",
            promoCode: "ABCD50",
            promoCodeDescription: "Use promo code for 50 user"
        ),
        NotificationCardModel(
            discount: 30.0,
            date: "4/10/24",
            imageURL: "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
            description: "Spring Sale is here! Enjoy 30% off selected items until the end of the week.",
            promoCode: "SPRING30",
            promoCodeDescription: "Apply this code at checkout"
        ),
        NotificationCardModel(
            discount: 20.0,
            date: "4/15/24",
            imageURL: "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
            description: "Limited offer! 20% off on all accessories. Upgrade your style now.",
            promoCode: "STYLE20",
            promoCodeDescription: "Use this for accessories only"
        ),
        NotificationCardModel(
            discount: 15.0,
            date: "5/1/24",
            imageURL: "https://images.unsplash.com/photo-1606813909027-88406c7e8de4",
            description: "Happy May! Get 15% off for all new users. Welcome aboard!",
            promoCode: "WELCOME15",
            promoCodeDescription: "First-time users only"
        ),
        NotificationCardModel(
            discount: 60.0,
            date: "5/18/24",
            imageURL: "https://images.unsplash.com/photo-1503602642458-232111445657",
            description: "Mega deal! Flat 60% off on selected electronics. Don’t miss it!",
            promoCode: "ELECTRO60",
            promoCodeDescription: "Valid on electronics only"
        )
    ]
}

