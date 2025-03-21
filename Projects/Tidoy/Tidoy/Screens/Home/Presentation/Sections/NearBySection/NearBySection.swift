//
//  NearBySection.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 21/03/2025.
//

import SwiftUI

struct NearBySection: View {
    let height: Double = 148
    let width: Double = 165
    var body: some View {
        VStack {
            HStack {
                Text("NearBy")
                Spacer()
                Button {
                    
                } label: {
                    Text("Show all")
                }

            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<5) { _ in
                        NearByCard(model: .sampleData, height: height, width: width)
                    }
                }
            }
        }
    }
}

#Preview {
    NearBySection()
        .padding()
}
