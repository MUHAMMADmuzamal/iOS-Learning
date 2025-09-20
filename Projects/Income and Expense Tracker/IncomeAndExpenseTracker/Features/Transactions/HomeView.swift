//
//  HomeView.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 07/09/2025.
//

import SwiftUI

struct HomeView: View {

    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.white
            
            backgroundRectangle
                
            VStack(spacing: 30) {
                headerView
                
                cardView
                .padding(.top, 7)
                
                transactionHistoryView

                senAgainView
    
            }
            .padding(.horizontal, 22)
            .padding(.top, 75)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
        .padding(.bottom, 10)
}

extension HomeView {
    private var backgroundRectangle: some View {
        BottomCurveRectangle()
            .fill(LinearGradient.tealGreenToTropicalTeal)
            .overlay(alignment: .topLeading) {
                Image(.rings)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            }
            .frame(height: 287)
    }
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Good After Noon")
                    .font(.inter(size: 14, weight: .medium))
                Text("Enjelin Morgeana")
                    .font(.inter(size: 20, weight: .semiBold))
            }
            .foregroundStyle(.white)
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.1))
                .frame(width: 40, height: 40)
                .overlay {
                    Image(.bell)
                        .font(.title)
                }
            
        }
    }
    
    private var cardView: some View {
        VStack(alignment: .leading) {
            cardViewTitle
            
            Text("$ 2,548.00")
                .font(.inter(size: 30, weight: .bold))
            
            Spacer()
            
            HStack{
                IncomeAndExpenseView(title: "Income",
                                     value: "$ 1,840.00",
                                     icon: "arrow.down")
                
                Spacer()
                
                IncomeAndExpenseView(title: "Expense",
                                     value: "$ 240.00",
                                     icon: "arrow.up")
            }
            
            Spacer()
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 25)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.tropicalTeal)
                .shadow(color: .teal58.opacity(0.5), radius: 20, x: 0, y: 20)
        }
        .frame(height: 200)
    }
    
    private var cardViewTitle: some View {
        HStack(alignment: .bottom) {
            HStack {
                Text("Total Balance")
                    .font(.inter(size: 16, weight: .semiBold))
                Image(systemName: "chevron.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
            }
            Spacer()
            Image(systemName: "ellipsis")
        }
    }
    
    private func IncomeAndExpenseView(title: String, value: String, icon: String) -> some View {
        VStack(spacing: .zero) {
            HStack {
                Circle()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 24)
                    .overlay {
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                    }
                Text(title)
                    .foregroundStyle(.lightTeal)
            }
            Text(value)
        }
        .font(.inter(size: 16, weight: .medium))
    }
    
    private var transactionHistoryView: some View {
        List {
            Section {
                ForEach(0..<10) { index in
                    TransactionHistoryRow()
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 8,
                                             leading: 0,
                                             bottom: 8,
                                             trailing: 0))
                }
            } header: {
                HStack {
                    Text("Transactions History")
                        .font(.inter(size: 18, weight: .semiBold))
                        .foregroundStyle(.black22)
                    Spacer()
                    Text("See all")
                        .font(.inter(size: 14, weight: .regular))
                        .foregroundStyle(.gray66)
                }
                .listRowInsets(.init(top: 0,
                                     leading: 0,
                                     bottom: 0,
                                     trailing: 0))
            }

        }
        .listStyle(.plain)
    }
    
    private var senAgainView: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Send Again")
                    .font(.inter(size: 18, weight: .semiBold))
                    .foregroundStyle(.black22)
                Spacer()
                Text("See all")
                    .font(.inter(size: 14, weight: .regular))
                    .foregroundStyle(.gray66)
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<10) { i in
                        SendAgainRow()
                    }
                }
            }
        }
    }
}
