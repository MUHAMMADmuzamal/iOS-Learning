//
//  BadgeBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

// List
// TabView
struct BadgeBootcamp: View {
    var body: some View {
        TabView{
            ZStack{
                List{
                    Text("Hello1")
                        .badge(10)
                    Text("Hello2")
                        .badge("New")
                    Text("Hello2")
                        .badge(0) // in case of zero no badge showen
                    Text("Hello1")
                }
            }
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(5)
            
            Color.green
                .tabItem { 
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge("New ")
            Color.blue
                .tabItem { 
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(0)
        }
    }
}

#Preview {
    BadgeBootcamp()
}
