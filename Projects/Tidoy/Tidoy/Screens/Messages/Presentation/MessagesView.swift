//
//  MessagesView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct MessagesView<VM: MessagesVMProtocol>: View {

    @StateObject var viewModel: VM
    
    init(viewModel: VM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationBarContainer {
            ScrollView(.vertical) {
                ForEach(viewModel.filteredMessages, id: \.id) { model in
                    MessagesScreenRow(model: model)
                    .padding(.horizontal, .padding16)
                }
            }
            .padding(.top, .padding16)
            .background(Color.background10.ignoresSafeArea())
        }.withCustomNavigationBar(navBar: {
            HStack {
                BackButtonView(action: {}, text: "")
                Spacer()
                SearchField(searchText: $viewModel.searchText, placeHolderText: "Search")
            }
            .padding(.horizontal, .padding16)
            .background(Color.background10.ignoresSafeArea())
        })
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        MessagesScreenBuilder.build(injector: DependenciesHolder.shared.injector())
    }
}
