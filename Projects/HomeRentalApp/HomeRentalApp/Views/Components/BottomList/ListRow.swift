//
//  ListRow.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 03/01/2024.
//

import SwiftUI

struct ListRow: View {
    var model: ListRowModel
    
    var body: some View {
        HStack{
            Image(model.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 75)
                .cornerRadius(11)
            Spacer()
                .frame(width:23)
            VStack(alignment: .leading){
                Text(model.name)
                    .font(Font.setRalewayFont(size: 17, weight: .medium))
                Spacer()
                    .frame(height: 8)
                Text("Rp. \(model.rent) / Year")
                    .font(Font.setRalewayFont(size: 13, weight: .regular))
                    .foregroundColor(.skyBlueD9)
                Spacer()
                    .frame(height: 5)
                HStack{
                    HStack{
                        Image("ic-bed")
                            .frame(width: 25, height: 25)
                        Text("\(model.bedRooms) Bedroom")
                    }
                    HStack{
                        Image("ic-bath")
                            .frame(width: 25, height: 25)
                        Text("\(model.bathRooms) Bedroom")
                            
                    }
                }
                .foregroundColor(.gray85)
            }
            
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(model: ListRowModel(image: "House", name: "Orchad House", rent: "2.500.000.000", bedRooms: 6, bathRooms: 6))
    }
}
