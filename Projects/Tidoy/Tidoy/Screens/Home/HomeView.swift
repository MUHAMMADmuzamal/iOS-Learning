//
//  HomeView.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 10/02/2025.
//

import SwiftUI

struct HomeView: View {
    private var router: HomeRouterProtocol!
    
    init(router: HomeRouterProtocol) {
        self.router = router
    }
    
    var body: some View {
        VStack {
            Text("Hello, World! Home ")
            Button {
                router.navigateToNotification()
            } label: {
                Text("Display Notification screen. ")
            }
        }
    }
}

#Preview {
    HomeView(router: HomeRouter(coordinator: AppCoordinator()))
}
