//
//  InitializerBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 01/10/2023.
//

import SwiftUI

struct InitializerBootcamp: View {
    
    let backgroundColor:Color
    let count:Int
    let title:String
    
    init(count:Int, fruit:Fruit) {
        self.count = count
        if fruit == .apples{
            self.title = "Apples"
            self.backgroundColor = .red
        }else{
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    
    enum Fruit{
        case apples
        case oranges
    }
    
    var body: some View {
        VStack(spacing:10){
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitializerBootcamp(count: 37,fruit:.apples)
            InitializerBootcamp(count: 37,fruit:.oranges)
        }
    }
}
