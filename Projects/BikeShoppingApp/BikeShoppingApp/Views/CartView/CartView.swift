//
//  CartView.swift
//  BikeShoppingApp
//
//  Created by Codes Orbit on 01/06/2024.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ZStack {
            Color.gray3B
                .ignoresSafeArea()
            VStack {
                CartNavBar()
                    .padding(.bottom, 30)
                PriceCard()
                PriceCard()
                PriceCard()
                Spacer()
                
            }
        }
    }
}

struct CartNavBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 56) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                .fill(LinearGradient.homeBackgroundLinearGradient)
                .frame(width: 40, height: 40)
            
                .shadow(color: Color(hex:"#2B3445").opacity(0.5), radius: 30, x: 0, y: -20)
                .shadow(color: Color(hex:"#10141C"), radius: 30, x: 0, y: 20)
                .overlay {
                    Image(systemName: "chevron.left")
                    
                }
            Text("PEUGEOT - LR01")
                .font(.system(size: 20, weight: .bold, design: .default))
            Spacer()
            
        }
        .foregroundStyle(.white)
        .padding([.leading ,.trailing],20)
    }
}

struct PriceCard: View {
    var body: some View {
        VStack {
            HStack( alignment: .center, spacing: 16) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient.priceCardImageBackgroundLinearGradient)
                    .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 1)
                    .frame(width: 100, height: 90)
                    .overlay {
                        Image("bicycle-1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 60)
                    }
                VStack(alignment: .leading) {
                    Spacer()
                    Text("PEUGEOT- LR01")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundStyle(.white)
                        .padding(.bottom, 24)
                    HStack {
                        Text("$ 1,999.99")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundStyle(.skyblueEA)
                        Spacer()
                        HStack(spacing: 0) {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 2)
                                .fill(LinearGradient.homeBackgroundLinearGradient)
                                .frame(width: 24, height: 24)
                                .overlay {
                                    Image(systemName: "plus")
                                }
                                .foregroundStyle(.white.opacity(0.6))
                            Text("1")
                                .foregroundStyle(.white)
                                .frame(width: 25)
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(LinearGradient.tabStrokeLinearGradient.opacity(0.2), lineWidth: 0.5)
                                .fill(Color(hex: "#353F54"))
                                .frame(width: 24, height: 24)
                                .overlay {
                                    Image(systemName: "minus")
                                }
                                .foregroundStyle(.white.opacity(0.6))
                        }
                    }
                    Spacer()
                }
            }
            .frame(height: 90)
            Spacer()
        }.frame(height: 107)
            .padding([.leading ,.trailing],20)
            .overlay {
                VStack {
                    Spacer()
                    Divider().frame(height: 0.5).background(.white.opacity(0.6))
                }
            }
    }
}

#Preview {
    CartView()
}
