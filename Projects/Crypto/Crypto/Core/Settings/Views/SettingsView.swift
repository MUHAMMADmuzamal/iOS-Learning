//
//  SettingsView.swift
//  Crypto
//
//  Created by Codes Orbit on 22/09/2024.
//

import SwiftUI

struct SettingsView: View {
    
    private let defaultURL = URL(string: "https://www.google.com")!
    private let youtubeURL = URL(string: "https://www.youtube.com")!
    private let coffeeURL = URL(string: "https://www.fb.com")!
    private let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    private let personalURL = URL(string: "https://www.github.com")!
    
    
    var body: some View {
        NavigationStack {
            List {
                swiftFullThinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .font(.headline)
            .tint(Color.blue)
            .listStyle(.grouped)
            .navigationTitle("Setting")
            .toolbarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XmarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    
    private var swiftFullThinkingSection: some View {
        Section {
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app made by following a swfiftul thinking course. Combine MVVM")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Subscribe on Youtube🥳", destination: youtubeURL)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
        } header: {
            Text("SwfitFull Thinking")
        }
    }
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The cryptocurrency data that is used in this app come from a free API from CoinGecko")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Subscribe on Youtube🥳", destination: youtubeURL)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app is develop by Muhammad Muzamal following Swiftful Thinking tutorial.")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Subscribe on Youtube🥳", destination: youtubeURL)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
        } header: {
            Text("Developer")
        }
    }
    
    private var applicationSection: some View {
        Section {
            Link("Term of Service", destination: coffeeURL)
            Link("Privacy and Policy", destination: coffeeURL)
            Link("Company Website", destination: coffeeURL)
            Link("Learn More", destination: coffeeURL)
        } header: {
            Text("Application")
        }
    }
}
