//
//  HomeView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI



struct HomeView<VM: HomeVMProtocol>: View {
    @StateObject private var viewModel: VM
    @State private var searchText: String = ""
    
    let screenWidth = UIScreen.screenWidth
    
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            
            background
            
            VStack {
                
                homeNavigationBar
                
                ScrollView {
                    
                    VStack {
                        
                        NearBySection(showAll: {
                            self.viewModel.navigateToNearByScreen()
                        }, tapOnCard: { _ in
                            
                        }, housesList: NearByCardModel.sampleDataList)
                        
                        FeatureSection(showAllDidTap: {
                            self.viewModel.navigateToFeaturePlacesScreen()
                        }, placesList: FeaturedCardModel.sampleData)
                        
                        selectionBar
                        
                        houseDetailSection
                    }
                }
            }
        }
    }
    
    private var background: some View {
        Color.background10
            .ignoresSafeArea()
    }
    
    private var selectionBar: some View {
        HStack {
            ForEach(self.viewModel.selectionBarItemsList) { model in
                HomeSelectionBarItem(model: model, onTap: self.viewModel.updateSelection)
            }
        }
        .frame(height: 70)
    }
    
    private var homeNavigationBar: some View {
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
                    .onTapGesture {
                        print("✅ ")
                        viewModel.navigateToMapScreen()
                    }
            }
            .frame(height: 48)
            .padding(.vertical, .padding8)
        }
        .padding(.horizontal, .padding16)
    }
    
    private var houseDetailSection: some View {
        VStack(spacing: .padding16) {
            ForEach(viewModel.houseListWithDetail) { data in
                DefaultCard(height: 172, width: screenWidth - .padding16, model: data)
            }
        }
        .padding(.vertical, .padding16)
    }
}

#Preview {
    let injector = DependenciesHolder.shared.injector()
    return HomeView(viewModel: HomeVM(router: HomeRouter(injector: injector),
                                      useCase: injector.resolve(HomeUseCaseProtocol.self)!,
                                      logger: injector.resolve(RemoteLogger.self)!))
}
