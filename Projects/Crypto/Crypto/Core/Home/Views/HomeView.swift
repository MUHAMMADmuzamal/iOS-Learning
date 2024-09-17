//
//  HomeView.swift
//  Crypto
//
//  Created by Codes Orbit on 13/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    @State private var showPortfolio: Bool = false // animate to right
    @State private var showPortfolioView: Bool = false // new sheet
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                
            // content layer
            VStack {
                homeHeader
                
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $homeViewModel.searchText)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    List {
                        ForEach(homeViewModel.portfolioCoins) { model in
                            CoinRowView(coin: model, showHoldingColumn: true)
                                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                        }
                    }
                    .refreshable {
                        homeViewModel.reloadData()
                    }
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showPortfolioView, content: {
                PortfolioView()
                    .environmentObject(homeViewModel)
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
                .toolbar(.hidden)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .background {
                    CircleButtonAnimationView(animate: $showPortfolio)
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none, value: showPortfolio)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(homeViewModel.allCoins) { model in
                CoinRowView(coin: model, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    homeViewModel.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: homeViewModel.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
