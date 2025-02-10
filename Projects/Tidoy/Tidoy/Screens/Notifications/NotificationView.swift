//
//  NotificationView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct NotificationView: View {
    private var router: NotificationRouterProtocol!
    
    init(router: NotificationRouterProtocol) {
        self.router = router
    }
    
    var body: some View {
        VStack {
            Text("Notifications")
            Button {
                router.navigateToMessages()
            } label: {
                Text("Display Messages screen. ")
            }
        }
    }
}

#Preview {
    NotificationView(router: NotificationRouter(coordinator: AppCoordinator()))
}
