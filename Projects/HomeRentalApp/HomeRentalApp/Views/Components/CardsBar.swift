//
//  CardsBar.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 31/12/2023.
//

import SwiftUI

struct CardsBar: View {
    var body: some View {
        NavigationLink {
            DetailView()
        } label: {
            VStack {
                HStack{
                    Text("Near from you")
                        .font(Font.setRalewayFont(size: 17, weight: .medium))
                    Spacer()
                    Text("See more")
                        .foregroundColor(.gray83)
                        .font(Font.setRalewayFont(size: 12, weight: .regular))
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25){
                        ForEach(0..<5, content: {_ in
                            Cards(model: CardModel(image: "house", name: "Dreamsville House", location: "Jl. Sultan Iskandar Muda", distance: "1.8 Km"))
                        })
                    }
                }
            }
            .padding()
        }

    }
}

struct Cards: View {
    let model: CardModel
    var body: some View {
        VStack {
            Image(model.image)
                .resizable()
                .cornerRadius(21)
                .frame(width: 237, height: 290)
                .overlay(
                    VStack{
                        Spacer()
                        Rectangle()
                            .frame(width:237, height:100)
                            .blur(radius: 90)
                    }
                        .cornerRadius(21)
                        .clipped()
                )
                .overlay(
                    VStack(alignment:.leading){
                        HStack {
                            Spacer()
                            distance
                        }
                        Spacer()
                        Text(model.name)
                            .font(.setRalewayFont(size: 17, weight: .medium))
                        
                        Text(model.location)
                            .font(.setRalewayFont(size: 12, weight: .regular))
                    }
                        .padding()
                        .foregroundColor(.white)
                )
        }
    }
    
    private var distance: some View {
        HStack() {
            Image("ic-location")
            Text(model.distance)
                .font(.setRalewayFont(size: 12, weight: .regular))
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.top, 5)
        .padding(.bottom, 5)
        .background(
            RoundedRectangle(cornerRadius: 21)
                .foregroundColor(Color.black.opacity(0.24))
            
        )
    }
}

struct CardsBar_Previews: PreviewProvider {
    static var previews: some View {
        CardsBar()
    }
}
