//
//  SearchBar.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 26/12/2023.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText: String = ""
    var body: some View {
        HStack{
            textField
            filterButton
        }
        .padding(.leading)
        .padding(.trailing)
    }
    
    private var textField: some View {
        HStack {
            Image("ic-search")
                .frame(width: 26, height: 26)
            TextField("", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(alignment: .leading){
                    Text("Search address, or near you")
                        .foregroundColor(searchText.isEmpty ? .gray83 : .clear)
                }
        }
        .frame(height: 50)
        .background(Color.whiteF7)
        .cornerRadius(11)
        
    }
    
    private var filterButton: some View{
        RoundedRectangle(cornerRadius: 11)
            .fill(Gradient.oceanBlue)
            .overlay(
                Image("ic-filter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:25, height: 25)
            )
            .frame(width: 50, height: 50)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
