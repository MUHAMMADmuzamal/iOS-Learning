//
//  SearchField.swift
//  Tidoy
//
//  Created by Codes Orbit on 28/09/2024.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchText: String
    var placeHolderText: String = ""
    
    init(searchText: Binding<String>, placeHolderText: String = "Search") {
        self._searchText = searchText
        self.placeHolderText = placeHolderText
    }
    
    var body: some View {
        HStack {
            TextField("", text: $searchText,
                      prompt: Text(placeHolderText)
                .foregroundStyle(searchText.isEmpty ? .text60 : .text100)
            )
                
            if searchText.isEmpty {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.icon60)
            } else {
                Image(systemName: "xmark.circle.fill")
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.icon100)
                    .onTapGesture {
                        searchText = ""
                        UIApplication.shared.endEditing()
                    }
            }
            
        }
        .frame(height: 50)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 1.0)
                .foregroundStyle(searchText.isEmpty ? .stroke60 : .stroke100)
        }
        .background(.background10Input)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        
    }
}

#Preview {
    SearchField(searchText: .constant(""))
        .frame(height: 100)
        .padding()
}
