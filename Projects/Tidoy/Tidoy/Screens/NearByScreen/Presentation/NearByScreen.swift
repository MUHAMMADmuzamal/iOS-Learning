//
//  NearByScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import SwiftUI

struct NearByScreen<VM: NearByScreenVMProtocol>: View {
    
    @StateObject var viewModel: VM
    
    init(viewModel: VM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationBarContainer {
            VStack {
                filterSection
                Rectangle()
                    .fill(Color.stroke40)
                    .frame(height: 1)
                
                
                cardsSection
            }
        }
        .withNavigationBar(title: "Near by", backAction: {
            viewModel.goBack()
        })
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var cell: some View {
        Color.background10
            .ignoresSafeArea()
    }
    
    private var cardsSection: some View {
        return ScrollView(.vertical) {
            Grid(horizontalSpacing: .padding12, verticalSpacing: .padding12) {
                ForEach(viewModel.rowsForGrid.indices, id: \.self) { rowIndex in
                    let row = viewModel.rowsForGrid[rowIndex]
                    NearByScreenRow(data: row)
                    
                }
            }
            .padding(.horizontal, .padding16)
        }
    }
    
    private var filterSection: some View {
        HStack(spacing: .padding8) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .padding8) {
                    ForEach(viewModel.filtersDataSource, id: \.id) { model in
                        FilterCell(model: model){ selectedModel in
                            viewModel.updateFilterDataSourceModel(selectedModel)
                        }
                    }
                }
                .frame(height: 50)
            }
            Spacer()
            FilterButton() {}
        }
        .padding(.horizontal, .padding16)
    }
}

#Preview {
    NavigationStack {
        NearByScreenBuilder.build(injector: DependenciesHolder.shared.injector())
    }
}

