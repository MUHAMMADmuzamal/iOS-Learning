//
//  PortfolioView.swift
//  Crypto
//
//  Created by Codes Orbit on 16/09/2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $homeViewModel.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XmarkButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    trailingNavBarButton
                }
            }
            .onChange(of: homeViewModel.searchText) { oldValue, newValue in
                if newValue.isEmpty {
                    removeSelectedCoin()
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeViewModel())
}


extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10 ){
                ForEach(homeViewModel.searchText.isEmpty ? homeViewModel.portfolioCoins : homeViewModel.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id  == coin.id ? Color.theme.green : Color.clear, lineWidth: 1.0)
                        }
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing:20) {
            HStack{
                
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith2Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount holding:")
                TextField("Ex. 1.4", text: $quantityText )
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value: ")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: quantityText)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("saved".uppercased())
            }
            .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0)
            
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        guard 
            let coin = selectedCoin,
            let amount = Double(quantityText) else { return }
        
        //save to core data
        homeViewModel.updatePortfolio(coin: coin, amount: amount)
        
        //show check mark
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        //hide keyboard
        UIApplication.shared.endEditing()
        
        //hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        homeViewModel.searchText = ""
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        if let portfolioCoin = homeViewModel.portfolioCoins.first(where: {$0.id == coin.id }),
            let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        }else {
            quantityText = ""
        }
        
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
}
