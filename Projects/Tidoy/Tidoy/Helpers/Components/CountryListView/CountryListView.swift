//
//  CountryListView.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/08/2024.
//

import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel: CountryListVM = CountryListVM()
    let action: ((CountryModel?) -> Void)
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Country")
                    .foregroundStyle(Color.text100)
                    .font(.heading6)
                Spacer()
                XmarkButton()
            }
            SearchField(searchText: $viewModel.searchText)
                .padding()
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.countriesList, id: \.code) { country in
                        CountryListRow(flag: country.flag,
                                       code: country.code,
                                       name: country.name,
                                       isSelected: viewModel.isSelected(country: country))
                            .onTapGesture {
                                viewModel.selectedCountry(country: country)
                                action(viewModel.selectedCountry)
                            }
                    }
                }
            }
            .background(.background10)
            .padding(.top, 16)
            .padding(.bottom, 48)
        }
        .padding(.horizontal, 16)
        .padding(.top, 45)
        .background(Color.background10)
        .clipShape(CustomRoundedRectangle(cornerRadius: 32, corners: [.topLeft, .topRight]))
        .ignoresSafeArea()
        
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
                Group {
                    Text(flag)
                    Text("(\(code))")
                    Text(name)
                }
                .font(.bodyMediumMedium)
                .foregroundStyle(.text100)
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
                } else {
                    Circle()
                        .stroke()
                        .fill(.stroke50)
                        .frame(width: 16)
                }
                
            }
            .padding(.all, 12)
        }
        .background(.background10)
        Divider()
            .background(.neutral40)
    }
}

#Preview {
    CountryListView { country in
        print("\(country)")
    }
}
