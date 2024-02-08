//
//  ContentView.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingSideBar: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                
                if isShowingSideBar{
                    SideBar()
                }
                Home()
//                    .background(Color.red)
                    .cornerRadius(isShowingSideBar ?  21 : 0)
                    .offset(x: isShowingSideBar ? 190 : 0, y: isShowingSideBar ? 20 : 0)
                    .onTapGesture(perform: {
                        withAnimation(.spring, {
                            isShowingSideBar.toggle()
                        })
                    })
            }
//            .background(Color.green)
            .padding(.top, isShowingSideBar ? 0 : 10)
            
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
