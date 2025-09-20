//
//  TransactionHistoryRow.swift
//  IncomeAndExpenseTracker
//
//  Created by Muhammad Muzamal on 20/09/2025.
//

import SwiftUI

struct TransactionHistoryRow: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.lightTealF5)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(.upwork)
                        .resizable()
                        .scaledToFit()
                        .padding(8)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Upwork".uppercased())
                    .font(.inter(size: 16, weight: .medium))
                    .foregroundStyle(.black)
                
                Text("Today")
                    .font(.inter(size: 13, weight: .regular))
                    .foregroundStyle(.gray66)
            }
            
            Spacer()
            
            Text("+ $ 850.00")
                .font(.inter(size: 18, weight: .semiBold))
                .foregroundStyle(.green69)
        }
    }
}
