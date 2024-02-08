//
//  OptionsBar.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 31/12/2023.
//

import SwiftUI

struct OptionsBar: View {
    init() {
          UIScrollView.appearance().bounces = false
       }
    
    let optionsList:[String] = ["Home","Apartment","Hotel","Vila","Cottage","Hello"]
    @State var selectedIndex: Int = 1
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(optionsList.enumerated()), id: \.offset) { index, text in
                    OptionButton(selected: index == selectedIndex, text: text)
                        .onTapGesture(perform: {
                            selectedIndex = index
                        })
                }
                
            }
        }
        .padding()
    }
}


struct OptionButton: View {
    let selected: Bool
    let text: String
    var body: some View {
        VStack(spacing:1) {
            Text(text)
                .foregroundColor(selected ? .white : .gray83)
                .frame(height: 36)
                .padding(.leading, 17)
                .padding(.trailing, 17)
                .background(
                        RoundedRectangle(cornerRadius: 11)
                            .fill(selected ?
                              Gradient.oceanBlue : LinearGradient(colors: [Color.whiteF7], startPoint: .top, endPoint: .bottom))
            )
//            if selected{
//                Ellipse()
//                    .fill(Gradient.oceanBlue.opacity(0.5))
//                    .frame(height:5)
//            }
        }
    }
}

struct OptionsBar_Previews: PreviewProvider {
    static var previews: some View {
        OptionsBar()
    }
}
