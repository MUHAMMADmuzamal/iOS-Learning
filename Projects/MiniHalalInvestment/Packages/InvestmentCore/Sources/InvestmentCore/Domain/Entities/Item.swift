//
//  Item 2.swift
//  InvestmentCore
//
//  Created by Muhammad Muzamal on 29/09/2025.
//


struct Item: Identifiable {
    var id: String
    var name: String
    var description: String
    var price: Double
    var imagesURL: [String]
    var investment: Investment?
}

extension Item {
    var investerCount: Int {
        investment?.investors.count ?? 0
    }
}

struct Investment {
    var minimumInvestmentAmount: Double
    var investors: [String]
}
