//
//  NotificationView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct NotificationView: View {
    private var viewModel: NotificationVMProtocol!
    
    init(viewModel: NotificationVMProtocol) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Notifications")
            Button {
                viewModel.navigateToMessages()
            } label: {
                Text("Display Messages screen. ")
            }
        }
    }
}

#Preview {
    NotificationView(viewModel: NotificationVM(router: NotificationRouter(injector: DependenciesHolder().injector())))
}
