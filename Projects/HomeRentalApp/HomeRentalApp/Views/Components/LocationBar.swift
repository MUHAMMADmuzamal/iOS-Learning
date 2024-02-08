//
//  LocationBar.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 24/12/2023.
//

import SwiftUI

struct LocationBar: View {
    @State var selectedLocationName: String = "Pakistan"
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Location")
                .fontWeight(.light)
                .foregroundColor(Color.gray83)
                .font(Font.custom("Raleway", size: 12))
            
            HStack {
                Text(selectedLocationName)
                    .fontWeight(.medium)
                    .font(Font.custom("Raleway", size: 21))
                Image("ic-arrow-down")
                Spacer()
                Image("ic_bell")
                    .overlay(alignment: .topTrailing){
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.red)
                    }
            }
        }
        .padding()
    }
}

struct LocationBar_Previews: PreviewProvider {
    static var previews: some View {
        LocationBar()
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
