//
//  HomeView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct SelectionBarItemModel: Identifiable {
    let id: String
    let title: String
    let iconName: String
    var isSelected: Bool
    
    init(id: String, title: String, iconName: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.iconName = iconName
        self.isSelected = isSelected
    }
    
    init(title: String, iconName: String, isSelected: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.iconName = iconName
        self.isSelected = isSelected
    }
    
}

struct SelectionBarItem: View {
    let model: SelectionBarItemModel
    
    var body: some View {
        VStack {
            Image(model.iconName)
            Text(model.title)
            
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(model.isSelected ? .icon100 : .clear)
        }
        .foregroundStyle(model.isSelected ? .icon100 : .icon60)
    }
}

struct HomeView<VM: HomeVMProtocol>: View {
    @StateObject private var viewModel: VM
    @State private var searchText: String = ""
    
    @State private var selectionBarItemsList: [SelectionBarItemModel] = [
        SelectionBarItemModel(title: "All", iconName: "allIcon", isSelected: false),
        SelectionBarItemModel(title: "House", iconName: "houseIcon", isSelected: false),
        SelectionBarItemModel(title: "Villa", iconName: "villaIcon", isSelected: true),
        SelectionBarItemModel(title: "Apartment", iconName: "apartmentIcon", isSelected: false),
        SelectionBarItemModel(title: "Hotels", iconName: "hotelsIcon", isSelected: false),
    ]
    
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.background10
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    // navbar
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Find your place in")
                                    .font(.bodyXSmallRegular)
                                    .foregroundStyle(Color.text60)
                                HStack(spacing: 8) {
                                    Image("location")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("Bandung, Indonesia")
                                        .font(.bodyLargeSemiBold)
                                        .foregroundStyle(Color.text100)
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .frame(width: 10, height: 6)
                                        .foregroundStyle(Color.icon60)
                                        .padding(.leading, .padding4)
                                }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 24) {
                                Image("messages")
                                Image("notification")
                            }
                            .frame(height: 32)
                            .foregroundStyle(Color.icon80)
                        }
                        
                        HStack {
                            SearchField(searchText: $searchText, placeHolderText: "where are you going?")
                            
                            Image("mapImage")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 48)
                        }
                        .frame(height: 48)
                        .padding(.vertical, .padding8)
                    }
                    .padding(.horizontal, .padding16)
                    
                    
                    NearBySection(housesList: NearByCardModel.sampleDataList)
                    FeatureSection(placesList: FeaturedCardModel.sampleData)
                    
                    HStack {
                        ForEach(selectionBarItemsList) { model in
                            SelectionBarItem(model: model)
                        }
                    }
                    .frame(height: 70)
                }
            }
        }
    }
}

#Preview {
    let injector = DependenciesHolder.shared.injector()
    return HomeView(viewModel: HomeVM(router: HomeRouter(injector: injector),
                                      useCase: injector.resolve(HomeUseCaseProtocol.self)!,
                                      logger: injector.resolve(RemoteLogger.self)!))
}
