//
//  ToolBarItemsBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 28/01/2024.
//

import SwiftUI

struct ToolBarItemsBootcamp: View {
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo.ignoresSafeArea()
                ScrollView {
                    TextField("Place holder",text: $text )
                        .background(Color.yellow)
                    ForEach(0..<50) { _ in
                        Rectangle().frame(width: 200, height: 200)
                    }
                }
               
//                Text("Hi🙋‍♂️")
//                    .foregroundStyle(Color.white)
            }
            .navigationTitle("Toolbar")
//            .navigationBarItems(leading: Image(systemName: "heart.fill"), trailing: Image(systemName: "heart.fill"))
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "heart.fill").foregroundStyle(Color.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gear").foregroundStyle(Color.gray)
                }
                ToolbarItem(placement: .bottomBar) {
                    Image(systemName: "heart").foregroundStyle(Color.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                ToolbarItem(placement: .keyboard) {
                    Image(systemName: "highlighter").foregroundStyle(Color.red)
                }
            })
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarTitleMenu {
                Button("Screen 1"){
                    
                }
                Button("Screen 2"){
                    
                }
            }
        }
    }
}

#Preview {
    ToolBarItemsBootcamp()
}
