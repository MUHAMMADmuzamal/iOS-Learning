//
//  NotificationView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct NotificationView<VM: NotificationVMProtocol>: View {
    @StateObject var viewModel: VM
    
    init(viewModel: VM) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationBarContainer {
            ScrollView(.vertical) {
                cards
                    .padding(.horizontal, .padding16)
            }
            .padding(.top, .padding16)
        }
        .withNavigationBar(title: "Notification", backAction: {
            viewModel.goBack()
        }, padding: .padding16)
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    
    private var cards: some View {
        VStack(spacing: .padding16) {
            ForEach(NotificationCardModel.sampleData, id: \.id) { model in
                NotificationCard(model: model)
            }
        }
    }
}

#Preview {
    NotificationView(viewModel: NotificationVM(router: NotificationRouter(injector: DependenciesHolder.shared.injector())))
}
