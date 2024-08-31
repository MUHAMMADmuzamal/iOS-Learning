//
//  CountryListView.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/08/2024.
//

import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel: CountryListVM = CountryListVM()
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 50)
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.getCountryList(), id: \.code) { country in
                        CountryListRow(flag: country.flag, code: country.code, name: country.name, isSelected: true)
                    }
                }
            }
            .background(.background10)
            .padding([.leading, .top, .trailing], 16)
            .padding(.bottom, 48)
        }
    }
}

struct CountryListRow: View {
    let flag: String
    let code: String
    let name: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text(flag)
                Text("(\(code))")
                Text(name)
                Spacer()
                if isSelected {
                    Circle()
                        .stroke()
                        .fill(.infoMain)
                        .frame(width: 16)
                        .overlay {
                            Circle()
                                .fill(.infoMain)
                                .frame(width: 8)
                        }
                }else {
                    Circle()
                        .stroke()
                        .fill(.stroke50)
                        .frame(width: 16)
                }
                
            }
            .padding(.all, 12)
        }
        Divider()
    }
}

#Preview {
    CountryListView()
}
