//
//  Home.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 24/12/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            LocationBar()
            SearchBar()
            OptionsBar()
            CardsBar()
            BottomList()
                
                
        }.ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
