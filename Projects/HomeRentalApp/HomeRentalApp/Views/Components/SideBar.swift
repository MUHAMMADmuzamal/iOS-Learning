//
//  SideBar.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 08/01/2024.
//

import SwiftUI

struct SideBar: View {
    @State var selectedIndex: Int = 0
    @State var sideBarData: [SideBarModel] = [
        SideBarModel(title: "Home", icon: "house.fill", divider: false),
        SideBarModel(title: "Profile", icon: "person.crop.circle", divider: false),
        SideBarModel(title: "Nearby", icon: "location", divider: true),
        SideBarModel(title: "Bookmark", icon: "bookmark", divider: false),
        SideBarModel(title: "Notification", icon: "bell", divider: false),
        SideBarModel(title: "Message", icon: "message", divider: true),
        SideBarModel(title: "Setting", icon: "gear", divider: false),
        SideBarModel(title: "Help", icon: "questionmark.circle", divider: false),
        SideBarModel(title: "Logout", icon: "power", divider: false),
    ]
    var body: some View {
        VStack(alignment: .leading){
        Spacer()
                .frame(height: 138)
            ForEach(Array(sideBarData.enumerated()), id: \.offset){ index, model in
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Image(systemName: model.icon)
                            .frame(width: 25, height: 25)
                        Spacer()
                            .frame(width:17)
                        Text(model.title)
                            .font(.setRalewayFont(size: 17, weight: .medium))
                        Spacer()
                    }
                    .foregroundColor(index == selectedIndex ? .black : .white)
                    .frame(height: 42)
                    .background(
                        HStack(spacing:-21){
                            Rectangle()
                                .frame(width: 150,height:42)
                                Circle()
                                .frame(width: 42, height:42)
                            Spacer()
                        }
                            .foregroundStyle(index == selectedIndex ? .white : .skyBlueD9)
                    )
                    Rectangle()
                        .frame(width: 171, height:1).foregroundStyle(model.divider ? Color.white : Color.skyBlueD9)
                }
                .onTapGesture(perform: {
                    selectedIndex = index
                    print(index)
                })
            }
            Spacer()
                    .frame(height: 138)
        }
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity,
          alignment: .topLeading
        )
        .background(Color.skyBlueD9)
        
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
