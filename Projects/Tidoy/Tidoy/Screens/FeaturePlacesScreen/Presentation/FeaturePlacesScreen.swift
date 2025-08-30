//
//  FeaturePlacesScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 13/05/2025.
//

import SwiftUI

struct FeaturePlacesScreen<VM: FeaturePlacesScreenVMProtocol>: View {
    
    @StateObject var viewModel: VM
    
    init(viewModel: VM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationBarContainer {
            VStack {
                cardsSection
            }.padding(.top, 10)
        }.withNavigationBar(title: "Feature Destination") {
            viewModel.goBack()
        }
    }
    
    private var cardsSection: some View {
        return ScrollView(.vertical) {
            Grid(horizontalSpacing: .padding12, verticalSpacing: .padding12) {
                ForEach(viewModel.rowsForGrid.indices, id: \.self) { rowIndex in
                    let row = viewModel.rowsForGrid[rowIndex]
                    FeaturePlacesScreenRow(data: row)
     
                }
            }
            .padding(.horizontal, .padding16)
        }
    }
    
}

#Preview {
    FeaturePlacesScreenBuilder.build(injector: DependenciesHolder.shared.injector())
}
