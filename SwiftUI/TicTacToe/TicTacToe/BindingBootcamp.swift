//
//  BindingBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 10/10/2023.
//

import SwiftUI

struct BindingBootcamp: View {
    @State var backgroundColor:Color = .green
    @State var title: String = "Binding"
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}

struct ButtonView: View {
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = .pink
    @Binding var title: String
    var body: some View {
        Button(){
            backgroundColor = .pink
            buttonColor = .green
            title = "Binding Title"
        }label:{
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}
