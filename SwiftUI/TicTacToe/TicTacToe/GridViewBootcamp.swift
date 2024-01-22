//
//  GridViewBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 03/10/2023.
//

import SwiftUI

struct GridViewBootcamp: View {
    
    let columns: [GridItem]=[
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
//        GridItem(.adaptive(minimum:10, maximum:300), spacing: nil, alignment: nil),
//        GridItem(.adaptive(minimum:150, maximum:300), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(100), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(Color.orange)
                .frame(height:400)
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 6, pinnedViews: [.sectionHeaders]){
                
                Section(header:
                            Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .background(.blue)
                    .padding()
                ){
                    ForEach(0..<10){ index in
                        Rectangle()
                            .frame(height:150)
                    }
                }
                    
                
                Section(header:
                            Text("Section 2")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .background(.red)
                    .padding()
                ){
                    ForEach(0..<20){ index in
                        Rectangle()
                            .fill(.green)
                            .frame(height:150)
                    }
                }
                
                
//                ForEach(0..<50){ index in
//                    Rectangle()
//                        .frame(height:150)
//                }
            }
            
//            LazyVGrid(columns: columns) {
//                ForEach(0..<50){ index in
//                    Rectangle()
//                        .frame(height:150)
//                }
//            }
        }
    }
}

struct GridViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridViewBootcamp()
    }
}
