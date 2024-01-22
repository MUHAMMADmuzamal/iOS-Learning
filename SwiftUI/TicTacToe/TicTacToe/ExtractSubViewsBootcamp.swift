//
//  ExtractSubViewsBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 09/10/2023.
//

import SwiftUI

struct ExtractSubViewsBootcamp: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
          contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 5, color: .green)
            MyItem(title: "Oranges", count: 15, color: .orange)
            MyItem(title: "Bananas", count: 25, color: .yellow)
        }
    }
}

struct ExtractSubViewsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewsBootcamp()
    }
}

struct MyItem: View {
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack{
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
