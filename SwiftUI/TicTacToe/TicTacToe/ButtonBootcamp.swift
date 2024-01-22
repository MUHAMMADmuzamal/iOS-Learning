//
//  ButtonBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 07/10/2023.
//

import SwiftUI

struct ButtonBootcamp: View {
    @State var title = "This is my Title"
    var body: some View {
        VStack(spacing:10) {
            Text("Hello world")
            Text(title)
            Button("Press me"){
                self.title = "Button is Pressed."
            }
            .accentColor(.red)
            
            Button(
                action: {
                    self.title = "Button#2 Pressed"
                },
                label: {
                    Text("Save".uppercased())
                        .frame(width:50, height:40)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .background(
                            Color.blue
                                .cornerRadius(10)
                                .shadow(radius: 20)
                        )
                }
            )
            
            Button(){
                self.title = "Button# 3"
            }label:{
                Circle()
                    .fill(.white)
                    .frame(width:75, height:75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.red)
                    )
            }
            
            Button(){
                self.title = "Finished.".uppercased()
            }label:{
                Text("Finished".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth:2.0)
                    )

            }
        }
        
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
