//
//  NavigationViewBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 24/10/2023.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            //DO NOT ADD ANOTHER NAVIGATION IN hierarchy USE NAVIGATION LINK IT NOT GIVE ERROR BUT GENERATE GLITCH.
            ScrollView {
                NavigationLink("Next Screen", destination: MyOtherScreen())
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle(Text("All inboxes"))
//            .navigationBarTitleDisplayMode(.large)
//            .navigationBarHidden(true)
            .navigationBarItems(
                leading: HStack{
                    Image(systemName: "person.fill")
                    Image(systemName: "flame.fill")
                },
                trailing: NavigationLink(destination: MyOtherScreen(), label: {
                    Image(systemName: "gear")
                })
                .accentColor(.red)
            )
            
        }
    }
}

struct MyOtherScreen: View{
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        ZStack{
            Color.green.ignoresSafeArea()
            VStack{
                Text("Second Screen")
                    .navigationTitle("Green Screen")
//                    .navigationBarHidden(true)
                
                Button("Back"){
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Third Screen", destination: Text("Third Screen"))
            }
        }
    }
}
struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
