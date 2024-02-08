//
//  BottomList.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 03/01/2024.
//

import SwiftUI

struct BottomList: View {
    var housesList: [ListRowModel] = [
        ListRowModel(image: "house-1", name: "Orchad House", rent: "2.500.000.000", bedRooms: 6, bathRooms: 6),
        ListRowModel(image: "house-2", name: "Dream House", rent: "2.500.000.000", bedRooms: 4, bathRooms: 2),
        ListRowModel(image: "house", name: "My House", rent: "2.500.000.000", bedRooms: 14, bathRooms: 12),
    ]
                
    var body: some View {
        VStack {
            HStack {
                Text("Best for you")
                    .font(Font.setRalewayFont(size: 17, weight: .medium))
                Spacer()
                Text("See more")
                    .foregroundColor(.gray85)
                    .font(Font.setRalewayFont(size: 13, weight: .regular))
            }
            .padding()
                .frame(height: 25)
            ScrollView{
                VStack{
                    ForEach(housesList, id: \.self){ model in
                        ListRow(model: model)
                    }
                }
            }
        }
    }
}

struct BottomList_Previews: PreviewProvider {
    static var previews: some View {
        BottomList()
    }
}
